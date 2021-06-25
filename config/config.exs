# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :wabanex,
  ecto_repos: [Wabanex.Repo]

config :wabanex, Wabanex.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :wabanex, WabanexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZzZ4rnDDN3KOJVw7wtITkDK6oG/02bpw7h9/wS1XHwKGlOCTOqvfL22xGndLBuc1",
  render_errors: [view: WabanexWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Wabanex.PubSub,
  live_view: [signing_salt: "lTlMYZQ5"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
