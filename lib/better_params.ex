defmodule BetterParams do
  import Plug.Conn

  def init(_), do: :ok

  def call(%{params: params} = conn, :ok) do
    %{ conn | params: symbolize_merge(params) }
  end


  def symbolize_merge(map) when is_map(map) do
    map
    |> Map.delete(:__struct__)
    |> ExUtils.Map.symbolize_keys(deep: true)
    |> Map.merge(map)
  end

end
