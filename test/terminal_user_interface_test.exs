defmodule TerminalUserInterfaceTest do
  use ExUnit.Case
  doctest TerminalUserInterface

  test "greets the world" do
    assert TerminalUserInterface.hello() == :world
  end
end
