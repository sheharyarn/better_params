defmodule BetterParams do
  import Plug.Conn

  @moduledoc """
  Implementation of the `BetterParams` plug and its core logic.

  See the [`README`](https://github.com/sheharyarn/better_params) for
  installation and usage instructions.
  """




  @doc """
  Initializes the Plug.

  This plug doesn't take any arguments.
  """
  def init(_) do
    :ok
  end




  @doc """
  Implementation of the Plug

  This implements the `call` callback of the Plug. It calls the
  `symbolize_merge/1` method on the `Plug.Conn` params map, so
  they are available both with String and Atom keys.
  """
  def call(%{params: params} = conn, :ok) do
    %{ conn | params: symbolize_merge(params) }
  end




  @doc """
  Core logic of the Plug

  Takes a Map with String keys and returns a new map with
  all values accessible by both String and Atom keys.

  If the map is nested, it symbolizes all sub-maps
  as well.

  ## Example

  ```
  map = %{"a" => 1, "b" => %{"c" => 2, "d" => 3}}

  map = BetterParams.symbolize_merge(map)
  # => %{:a => 1, :b => %{c: 2, d: 3}, "a" => 1, "b" => %{"c" => 2, "d" => 3}}

  map[:a]           # => 1
  map[:b][:c]       # => 2
  map.b.d           # => 3
  ```
  """
  def symbolize_merge(map) when is_map(map) do
    map
    |> Map.delete(:__struct__)
    |> symbolize_keys
    |> Map.merge(map)
  end

  defp symbolize_keys(list) when is_list(list), do: Enum.map(list, &symbolize_keys/1)
  defp symbolize_keys(map) when is_map(map) do
    Enum.reduce map, %{}, fn {k, v}, m ->
      map_put(m, k, symbolize_keys(v))
    end
  end
  defp symbolize_keys(term), do: term


  defp map_put(map, k, v) when is_map(map) do
    try do
      cond do
        is_binary(k) -> Map.put(map, String.to_existing_atom(k), v)
        true         -> Map.put(map, k, v)
      end
    rescue
      ArgumentError -> map
    end
  end

end
