defmodule Pomaid.AppTest do
  use ExUnit.Case, async: true
  doctest Pomaid.App
  import Pomaid.App
  import Mock

  describe "init" do
    test "it uses FileInterface to load the initial state" do
      with_mock Pomaid.FileInterface,
        read_todo_file: fn _filename -> {:ok, ["task 1", "task 2"]} end,
        select_todo_file: fn -> {:ok, "todo.txt"} end do
        assert init("context") == %{todo: ["task 1", "task 2"]}
      end
    end
  end

  describe "update" do
    test "when r is pressed, it reloads the todo file" do
      with_mock Pomaid.FileInterface,
        read_todo_file: fn _filename -> {:ok, ["task 1", "task 2"]} end,
        select_todo_file: fn -> {:ok, "todo.txt"} end do
        assert update([], {:event, %{ch: ?r}}) == %{todo: ["task 1", "task 2"]}
      end
    end
  end

  # TODO: figure out somewhere else to put the output
  describe "render" do
    test "The app looks correct" do
      with_mock Pomaid.FileInterface,
        read_todo_file: fn _filename -> {:ok, ["task 1", "task 2"]} end,
        select_todo_file: fn -> {:ok, "todo.txt"} end do
        assert render(%{todo: ["task 1", "task 2"]}) == %Ratatouille.Renderer.Element{
                 attributes: %{},
                 children: [
                   %Ratatouille.Renderer.Element{
                     attributes: %{
                       attributes: [:bold, :underline],
                       background: :green,
                       color: :black,
                       content: "Pomaid (q to quit, r to reload)"
                     },
                     children: [],
                     tag: :label
                   },
                   %Ratatouille.Renderer.Element{
                     attributes: %{},
                     children: [
                       %Ratatouille.Renderer.Element{
                         attributes: %{size: 4},
                         children: [
                           %Ratatouille.Renderer.Element{
                             attributes: %{title: "To Do:"},
                             children: [
                               %Ratatouille.Renderer.Element{
                                 attributes: %{title: {:todo, ["task 1", "task 2"]}},
                                 children: [],
                                 tag: :panel
                               }
                             ],
                             tag: :panel
                           }
                         ],
                         tag: :column
                       },
                       %Ratatouille.Renderer.Element{
                         attributes: %{size: 4},
                         children: [
                           %Ratatouille.Renderer.Element{
                             attributes: %{title: "Doing:"},
                             children: [],
                             tag: :panel
                           }
                         ],
                         tag: :column
                       },
                       %Ratatouille.Renderer.Element{
                         attributes: %{size: 4},
                         children: [
                           %Ratatouille.Renderer.Element{
                             attributes: %{title: "Done:"},
                             children: [],
                             tag: :panel
                           }
                         ],
                         tag: :column
                       }
                     ],
                     tag: :row
                   }
                 ],
                 tag: :view
               }
      end
    end
  end
end
