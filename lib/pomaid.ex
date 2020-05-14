defmodule Pomaid do
  @moduledoc """
    Main application
  """
  use Application

  def start(_type, _args) do
    children = [
      {Ratatouille.Runtime.Supervisor, runtime: [app: TerminalUserInterface]}
      # other workers...
    ]

    Supervisor.start_link(
      children,
      strategy: :one_for_one,
      name: Pomaid.Supervisor
    )
  end

  def stop(_state) do
    # Do a hard shutdown after the application has been stopped.
    #
    # Another, perhaps better, option is `System.stop/0`, but this results in a
    # rather annoying lag when quitting the terminal application.
    System.halt()
  end
end
