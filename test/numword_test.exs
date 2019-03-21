defmodule NumwordTest do
  use ExUnit.Case

  test "should return correct result for 6686787825" do
    assert Numword.run("6686787825") == [
             [["MOTOR", "TRUCK"]],
             [["NOUN", "STRUCK"], ["NOUNS", "TRUCK"]],
             [["ONTO", "STRUCK"]],
             [["MOTOR", "USUAL"]],
             [["NOUNS", "USUAL"]]
           ]
  end

  test "should return correct result for 2282668687" do
    assert Numword.run("2282668687") == [
             [["BAT", "CONTOUR"]],
             [["CAT", "CONTOUR"]],
             [["ACT", "CONTOUR"]],
             [["BAT", "AMOUNTS"]],
             [["CAT", "AMOUNTS"]],
             [["ACT", "AMOUNTS"], ["ACTA", "MOUNTS"]]
           ]
  end

  test "should raise error when given a string less than 10 characters" do
    assert_raise FunctionClauseError, fn ->
      Numword.run("22826687")
    end
  end

  test "should raise error when given a string which contains invalid values" do
    assert_raise KeyError, fn ->
      Numword.run("123456789a")
    end
  end
end
