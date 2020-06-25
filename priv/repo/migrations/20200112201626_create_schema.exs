defmodule Portishead.Repo.Migrations.CreateSchema do
  use Ecto.Migration

  def change do
    execute "CREATE SCHEMA IF NOT EXISTS premarcos"
    execute "CREATE EXTENSION IF NOT EXISTS pgcrypto"
    # execute "CREATE EXTENSION IF NOT EXISTS citext"
  end
end
