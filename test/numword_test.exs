defmodule NumwordTest do
  use ExUnit.Case
  doctest Numword

  test "greets the world" do
    assert Numword.hello() == :world
  end
end
