defmodule Portishead.MixProject do
  use Mix.Project

  def project do
    [
      app: :portishead,
      version: "0.1.0",
      elixir: ">= 1.9.0",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Portishead.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:cors_plug, "~> 2.0"},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ecto_sql, "~> 3.5"},
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.2"},
      {:phoenix, "~> 1.5"},
      {:phoenix_ecto, "~> 4.2"},
      {:phoenix_html, "~> 2.14"},
      {:plug_cowboy, "~> 2.4"},
      {:postgrex, ">= 0.0.0"},
      {:sobelow, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 0.5"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      compile: ["compile --warnings-as-errors"],
      "ecto.migrate": ["ecto.migrate --log-sql"],
      "ecto.schema.drop": ["run priv/repo/schema_drop.exs"],
      "ecto.setup": [
        "ecto.create",
        # "ecto.load --skip-if-loaded",
        "ecto.migrate"
      ],
      "ecto.seed": ["run priv/repo/seeds.exs"],
      "ecto.schema.reset": ["ecto.schema.drop", "ecto.setup"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.drop", "ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
