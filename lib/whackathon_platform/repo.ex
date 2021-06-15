defmodule WhackathonPlatform.Repo do
  use Ecto.Repo,
    otp_app: :whackathon_platform,
    adapter: Ecto.Adapters.Postgres
end
