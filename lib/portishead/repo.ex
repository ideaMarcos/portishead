defmodule Portishead.Repo do
  use Ecto.Repo,
    otp_app: :portishead,
    adapter: Ecto.Adapters.Postgres
end
