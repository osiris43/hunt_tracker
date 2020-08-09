# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :draw_hunts,
  ecto_repos: [DrawHunts.Repo]


# Configures the endpoint
config :draw_hunts, DrawHuntsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "v50NlbqbFi/dcReJcziZM3rQez4RQDrdH8cHnS3x3OcKCQ9gxdrJI9fFGtJz3sbR",
  render_errors: [view: DrawHuntsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DrawHunts.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# POW configuration for user management
config :draw_hunts, :pow,
  user: DrawHunts.Users.User,
  repo: DrawHunts.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
