defmodule SWSTest do
  use ExUnit.Case
  doctest SWS

  test "greets the world" do
    assert SWS.hello() == :world
  end
end
