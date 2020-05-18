defmodule Pomaid.App do
  @moduledoc """
    TUI: this is the Terminal User Interface for Pomaid
  """

  @behaviour Ratatouille.App

  import Ratatouille.View

  def init(_context), do: 0

  def update(model, msg) do
    case msg do
      {:event, %{ch: ?+}} -> model + 1
      {:event, %{ch: ?-}} -> model - 1
      _ -> model
    end
  end

  def render(model) do
    view do
      panel title: " Pomaid (q to quit)", color: :green, attributes: [:bold] do
        row do
          column size: 4 do
            panel title: 'To Do:' do
              label(content: "Counter is #{model} (+/- to increment/decrement)")
            end
          end

          column size: 4 do
            panel title: 'Doing:' do
              label(content: "Counter is #{model} (+/- to increment/decrement)")
            end
          end

          column size: 4 do
            panel title: 'Done:' do
              label(content: "Counter is #{model} (+/- to increment/decrement)")
            end
          end
        end
      end
    end
  end

  @doc """
  Hello world.

  ## Examples

      iex> Pomaid.App.hello()
      :world

  """
  def hello do
    :world
  end
end
