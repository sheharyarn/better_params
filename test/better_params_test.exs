defmodule BetterParams.Tests do
  use ExUnit.Case
  import BetterParams


  test "#symbolize_merge symbolizes a map and merges it with itself" do
    m_before = %{"a" => 1, "b" => 2, "c" => "3"}
    m_after  = Map.merge(m_before, %{a: 1, b: 2, c: "3"})

    assert symbolize_merge(m_before) = m_after
  end


  test "#symbolize_merge deep symbolizes maps" do
    m_before = %{"a" => 1, "b" => %{"c" => 2, "d" => "3"}}
    m_after  = Map.merge(m_before, %{a: 1, b: %{c: 2, d: "3"}})

    assert symbolize_merge(m_before) = m_after
  end

end
