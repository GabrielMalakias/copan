# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :copan,
  ecto_repos: [Copan.Repo]

# Configures the endpoint
config :copan, CopanWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "odIBgnMZSc94Q9zGmP8hO14wtg5W0+Ie4mfUeDtzt+abfJHotcF7Tk4V1ogs3qf5",
  render_errors: [view: CopanWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Copan.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :copan, Copan.Repo,
  migration_primary_key: [id: :uuid, type: :binary_id],
  migration_timestamps: [type: :utc_datetime]

config :triplex, repo: Copan.Repo

config :copan, CopanQueue.Broker,
   adapter: ConduitAMQP,
   url: "amqp://guest:guest@localhost:5672"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
