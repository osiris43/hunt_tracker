defmodule DrawHunts.Repo do
  use Ecto.Repo,
    otp_app: :draw_hunts,
    adapter: Ecto.Adapters.Postgres
end
