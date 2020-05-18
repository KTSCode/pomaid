defmodule Pomaid do
  @moduledoc """
    Main application
  """
  use Application

  def start(_type, _args) do
    runtime_opts = [
      app: Pomaid.App,
      shutdown: {:application, :pomaid}
    ]

    children = [
      {Ratatouille.Runtime.Supervisor, runtime: runtime_opts}
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

  @version Mix.Project.config()[:version]

  def version, do: @version
end
