defmodule BetterParams do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    conn
  end


  def symbolize_merge(map) when is_map(map) do
    map
    |> ExUtils.Map.symbolize_keys(deep: true)
    |> Map.merge(map)
  end

end
