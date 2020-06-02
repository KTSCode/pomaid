defmodule Pomaid.AppTest do
  use ExUnit.Case, async: true
  doctest Pomaid.App
  import Pomaid.App
  import Mock

  describe "update" do
    test "when r is pressed, it reloads the todo file" do
      with_mock Pomaid.FileInterface,
        read_todo_file: fn _filename -> {:ok, ["task 1", "task 2"]} end,
        select_todo_file: fn -> {:ok, "todo.txt"} end do
        assert update([], {:event, %{ch: ?r}}) == ["task 1", "task 2"]
      end
    end
  end
end
