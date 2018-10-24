defmodule BetterParams do
  @behaviour Plug

  @moduledoc """
  Implementation of the `BetterParams` plug and its core logic.

  See the [`README`](https://github.com/sheharyarn/better_params) for
  installation and usage instructions.
  """




  @doc """
  Initializes the Plug.
  """
  @impl Plug
  def init(opts) do
    opts
  end




  @doc """
  Implementation of the Plug

  This implements the `call` callback of the Plug. It calls the
  `symbolize_merge/2` method on the `Plug.Conn` params map, so
  they are available both with String and Atom keys.
  """
  @impl Plug
  def call(%{params: params} = conn, opts) do
    %{ conn | params: symbolize_merge(params, opts) }
  end




  @doc """
  Converts String keys of a Map to Atoms

  Takes a Map with String keys and an optional keyword list
  of options. Returns a new map with all values accessible
  by both String and Atom keys. If the map is nested, it
  symbolizes all sub-maps as well.

  The only option supported at this time is `drop_string_keys`
  which defaults to `false`. When set `true`, it will
  return a new map with only Atom version of the keys.

  ## Example

  ```
  map = %{"a" => 1, "b" => %{"c" => 2, "d" => 3}}

  mixed_map = BetterParams.symbolize_merge(map)
  # => %{:a => 1, :b => %{c: 2, d: 3}, "a" => 1, "b" => %{"c" => 2, "d" => 3}}

  atom_map = BetterParams.symbolize_merge(map, drop_string_keys: true)
  # => %{a: 1, b: %{c: 2, d: 3}}

  mixed_map[:a]           # => 1
  mixed_map[:b][:c]       # => 2
  mixed_map.b.d           # => 3
  ```
  """
  @spec symbolize_merge(map :: map, opts :: Keyword.t) :: map
  def symbolize_merge(map, opts \\ []) when is_map(map) do
    atom_map =
      map
      |> Map.delete(:__struct__)
      |> symbolize_keys

    if Keyword.get(opts, :drop_string_keys, false) do
      atom_map
    else
      Map.merge(map, atom_map)
    end
  end



  ## Private Methods


  defp symbolize_keys(%{__struct__: _module} = struct) do
    struct
  end

  defp symbolize_keys(map) when is_map(map) do
    Enum.reduce(map, %{}, fn {k, v}, m ->
      map_put(m, k, symbolize_keys(v))
    end)
  end

  defp symbolize_keys(list) when is_list(list) do
    Enum.map(list, &symbolize_keys/1)
  end

  defp symbolize_keys(term), do: term



  defp map_put(map, k, v) when is_map(map) do
    cond do
      is_binary(k) -> Map.put(map, String.to_existing_atom(k), v)
      true         -> Map.put(map, k, v)
    end
  rescue
    ArgumentError -> map
  end

end
