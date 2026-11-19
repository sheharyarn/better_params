defmodule BetterParams do
  @moduledoc """
  Implementation of the `BetterParams` plug and its core logic.

  See the [`README`](https://github.com/sheharyarn/better_params) for
  installation and usage instructions.
  """

  @behaviour Plug

  @doc """
  Initializes the Plug.
  """
  @impl true
  def init(opts), do: opts

  @doc """
  Implementation of the Plug

  This implements the `call` callback of the Plug. It calls the
  `atomize_merge/2` method on the `Plug.Conn` params map, so
  they are available both with String and Atom keys.
  """
  @impl true
  def call(%{params: params} = conn, opts) do
    %{conn | params: atomize_merge(params, opts)}
  end

  @doc """
  Converts String keys of a Map to Atoms

  Takes a Map with String keys and an optional keyword list
  of options. Returns a new map with all values accessible
  by both String and Atom keys. If the map is nested, it
  atomizes all sub-maps as well.

  The only option supported at this time is `drop_string_keys`
  which defaults to `false`. When set `true`, it will
  return a new map with only Atom version of the keys.

  ## Example

  ```
  map = %{"a" => 1, "b" => %{"c" => 2, "d" => 3}}

  mixed_map = BetterParams.atomize_merge(map)
  # => %{:a => 1, :b => %{c: 2, d: 3}, "a" => 1, "b" => %{"c" => 2, "d" => 3}}

  atom_map = BetterParams.atomize_merge(map, drop_string_keys: true)
  # => %{a: 1, b: %{c: 2, d: 3}}

  mixed_map[:a]           # => 1
  mixed_map[:b][:c]       # => 2
  mixed_map.b.d           # => 3
  ```
  """
  @spec atomize_merge(map(), Keyword.t()) :: map()
  def atomize_merge(map, opts \\ []) when is_map(map) do
    atom_map =
      map
      |> Map.delete(:__struct__)
      |> atomize_keys

    if Keyword.get(opts, :drop_string_keys, false) do
      atom_map
    else
      Map.merge(map, atom_map)
    end
  end

  @doc """
  Deprecated alias for `atomize_merge/2`.
  """
  @deprecated "Use atomize_merge/2 instead"
  @spec symbolize_merge(map(), Keyword.t()) :: map()
  def symbolize_merge(map, opts \\ []) when is_map(map) do
    atomize_merge(map, opts)
  end

  ## Private Methods

  defp atomize_keys(%{__struct__: _module} = struct) do
    struct
  end

  defp atomize_keys(map) when is_map(map) do
    Enum.reduce(map, %{}, fn {k, v}, m ->
      map_put(m, k, atomize_keys(v))
    end)
  end

  defp atomize_keys(list) when is_list(list) do
    Enum.map(list, &atomize_keys/1)
  end

  defp atomize_keys(term), do: term

  defp map_put(map, k, v) when is_map(map) do
    cond do
      is_binary(k) -> Map.put(map, String.to_existing_atom(k), v)
      true -> Map.put(map, k, v)
    end
  rescue
    ArgumentError -> map
  end
end
