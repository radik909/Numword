defmodule NumwordTest do
  use ExUnit.Case

  test "should return correct result for 6686787825" do
    assert Numword.run("6686787825") == [
             ["MOTOR", "TRUCK"],
             ["NOUN", "STRUCK"],
             ["NOUNS", "TRUCK"],
             ["ONTO", "STRUCK"],
             ["MOTOR", "USUAL"],
             ["NOUNS", "USUAL"]
           ]
  end

  test "should return correct result for 2282668687" do
    assert Numword.run("2282668687") == [
             ["BAT", "CONTOUR"],
             ["CAT", "CONTOUR"],
             ["ACT", "CONTOUR"],
             ["BAT", "AMOUNTS"],
             ["CAT", "AMOUNTS"],
             ["ACT", "AMOUNTS"],
             ["ACTA", "MOUNTS"]
           ]
  end
end
