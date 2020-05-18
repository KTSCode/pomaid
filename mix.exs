defmodule Pomaid.MixProject do
  use Mix.Project

  def project do
    [
      test_coverage: [tool: ExCoveralls],
      elixirc_options: [warnings_as_errors: true],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      app: :pomaid,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Pomaid, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:git_hooks, "~> 0.4.1", only: :dev, runtime: false},
      {:excoveralls, "~> 0.12.3", only: :test},
      {:credo, "~> 1.4.0", only: :dev, runtime: false},
      {:mix_test_watch, "~> 1.0.2", only: :dev, runtime: false},
      {:ex_doc, "~> 0.21.3", only: :dev, runtime: false},
      {:ratatouille, "~> 0.5.1"},
      {:dep_from_hexpm, "~> 0.3.0"}
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  # stops infinite test loop
  defp aliases do
    [
      test: "test --no-start",
      tw: "test.watch --no-start"
    ]
  end
end
