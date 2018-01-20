
# Test-Specific Modules
defmodule BetterParams.Tests.Meta do

  # Helper Methods
  defmodule Helpers do
    def build_upload(path) do
      %Plug.Upload{path: path, filename: Path.basename(path)}
    end
  end


  # Minimal Router to test our Plug against
  defmodule Router do
    use Plug.Router

    plug :match
    plug :dispatch
    plug BetterParams

    get "/test/:a/:b/:c" do
      send_resp(conn, 200, "ok")
    end

    post "/test/upload/:id" do
      send_resp(conn, 200, "ok")
    end
  end

  # String-dropping Router to test our Plug against
  defmodule AtomRouter do
    use Plug.Router

    plug :match
    plug :dispatch
    plug BetterParams, drop_string_keys: true

    get "/test/:a/:b/:c" do
      send_resp(conn, 200, "ok")
    end

    post "/test/upload/:id" do
      send_resp(conn, 200, "ok")
    end
  end
end



# Run our tests
ExUnit.start()
