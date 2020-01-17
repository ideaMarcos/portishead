# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :portishead,
  ecto_repos: [Portishead.Repo],
  generators: [binary_id: true]

config :portishead,
  mix_env: Mix.env()

config :portishead, Portishead.Repo,
  migration_primary_key: [name: :uuid, type: :uuid],
  migration_default_prefix: "premarcos"

# Configures the endpoint
config :portishead, PortisheadWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gIttBcgpBYUp80l7GVqVDG8vBJBIG9+9fw3/291tQ2xnsmSeRwi3y4wrPGl2uR2+",
  render_errors: [view: PortisheadWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Portishead.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
