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

  def render(_model) do
    view do
      panel title: " Pomaid (q to quit)", color: :green, attributes: [:bold] do
        row do
          column size: 4 do
            panel title: 'To Do:' do
            end
          end

          column size: 4 do
            panel title: 'Doing:' do
            end
          end

          column size: 4 do
            panel title: 'Done:' do
            end
          end
        end
      end
    end
  end

  @doc """

  ## Examples

      iex> Pomaid.App.hello()
      :world

  """
  def hello do
    :world
  end
end
