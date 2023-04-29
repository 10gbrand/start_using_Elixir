defmodule Learn1Test do
  use ExUnit.Case
  doctest Learn1

  test "greets the world" do
    assert Learn1.hello() == :world
  end
end
