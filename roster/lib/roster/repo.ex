defmodule Roster.Repo do
  use Ecto.Repo,
    otp_app: :roster,
    adapter: Ecto.Adapters.Postgres
end
