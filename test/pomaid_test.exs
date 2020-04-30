defmodule PomaidTest do
  use ExUnit.Case
  doctest Pomaid

  test "greets the world" do
    assert Pomaid.hello() == :world
  end
end
