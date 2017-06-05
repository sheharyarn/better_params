
# Minimal Router to test our Plug against
defmodule BetterParams.Tests.Meta.Router do
  use Plug.Router

  plug :match
  plug :dispatch
  plug BetterParams

  get "/test/:a/:b/:c" do
    send_resp(conn, 200, "ok")
  end
end


# Run our tests
ExUnit.start()

