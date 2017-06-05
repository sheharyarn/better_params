defmodule BetterParams.Tests do
  use ExUnit.Case
  use Plug.Test

  alias BetterParams.Tests.Meta.Router


  test "#symbolize_merge symbolizes a map and merges it with itself" do
    m_before = %{"a" => 1, "b" => 2, "c" => "3"}
    m_after  = Map.merge(m_before, %{a: 1, b: 2, c: "3"})

    assert BetterParams.symbolize_merge(m_before) == m_after
  end


  test "#symbolize_merge deep symbolizes maps" do
    m_before = %{"a" => 1, "b" => %{"c" => 2, "d" => "3"}}
    m_after  = Map.merge(m_before, %{a: 1, b: %{c: 2, d: "3"}})

    assert BetterParams.symbolize_merge(m_before) == m_after
  end



  @opts Router.init([])
  test "params map has both atom and string keys" do
    params =
      :get
      |> conn("/test/1/2/3")        # New Connection
      |> Router.call(@opts)         # Invoke Router
      |> Map.get(:params)           # Fetch Params


    # Assert param values
    assert params[:a]  == "1"
    assert params[:b]  == "2"
    assert params[:c]  == "3"

    assert params["a"] == "1"
    assert params["b"] == "2"
    assert params["c"] == "3"
  end

end
