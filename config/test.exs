use Mix.Config

# Configure your database
config :draw_hunts, DrawHunts.Repo,
  username: "postgres",
  password: "postgres",
  database: "draw_hunts_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
  migration_timestamps: [type: :utc_datetime]

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :draw_hunts, DrawHuntsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
