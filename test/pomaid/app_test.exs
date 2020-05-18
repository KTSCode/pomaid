defmodule PomaidAppTest do
  use ExUnit.Case
  doctest PomaidAppTest

  test "starts interface" do
    assert Pomaid.App.hello() == :world
  end
end
