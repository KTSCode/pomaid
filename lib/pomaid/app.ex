defmodule Pomaid.App do
  @moduledoc """
    TUI: this is the Terminal User Interface for Pomaid
  """

  @behaviour Ratatouille.App

  import Ratatouille.View
  import Pomaid.FileInterface

  def init(_context) do
    {:ok, file_name} = select_todo_file()
    {:ok, todos} = read_todo_file(file_name)
    todos
  end

  def update(model, msg) do
    case msg do
      {:event, %{ch: ?r}} ->
        init("reload")

      {:event, %{ch: ?+}} ->
        ["task" | model]

      {:event, %{ch: ?-}} ->
        [_head | tail] = model
        tail

      _ ->
        model
    end
  end

  def render(model) do
    view do
      # Title
      label(
        content: "Pomaid (q to quit, r to reload)",
        color: :black,
        background: :green,
        attributes: [:bold, :underline]
      )

      row do
        column size: 4 do
          panel title: "To Do:" do
            Enum.map(
              model,
              &panel title: &1 do
              end
            )
          end
        end

        column size: 4 do
          panel title: "Doing:" do
          end
        end

        column size: 4 do
          panel title: "Done:" do
          end
        end
      end
    end
  end
end
