defmodule BetterParams do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    conn
  end
end
