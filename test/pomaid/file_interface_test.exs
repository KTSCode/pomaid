defmodule Pomaid.FileInterfaceTest do
  use ExUnit.Case, async: true
  import Pomaid.FileInterface

  describe "test" do
    test "starts interface" do
      assert hello() == "world"
    end
  end
end
