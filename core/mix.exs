defmodule AquariumTemperatureMonitor.MixProject do
  use Mix.Project

  def project do
    [
      app: :aquarium_temperature_monitor,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {AquariumTemperatureMonitor.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:httpoison, "~> 1.5"},
      {:bypass, "~> 1.0", only: :test},
      {:plug_cowboy, "~> 2.0", only: :test},
      {:excoveralls, "~> 0.10", only: :test},
      {:credo, "~> 1.1.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.4", only: [:dev], runtime: false},
      {:ex_lcd, "~> 0.4.0"},
      {:timex, "~> 3.3"},
      {:sentry, "~> 7.0"}
    ]
  end

  defp aliases do
    [
      test: "test --no-start"
    ]
  end
end
