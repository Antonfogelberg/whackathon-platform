# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :whackathon_platform,
  ecto_repos: [WhackathonPlatform.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :whackathon_platform, WhackathonPlatformWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Bd3sfgMX6HmdGYyOoKDe9zd1l85HmGt1HrcbUBVRwhiQ4wuQ4290zm1iBYubevSv",
  render_errors: [view: WhackathonPlatformWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: WhackathonPlatform.PubSub,
  live_view: [signing_salt: "ZoTBI68d"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
