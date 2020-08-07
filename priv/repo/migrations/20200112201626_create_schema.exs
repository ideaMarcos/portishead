defmodule Portishead.Repo.Migrations.CreateSchema do
  use Ecto.Migration

  def change do
    schema = Application.get_env(:portishead, Portishead.Repo)[:migration_default_prefix]

    execute "CREATE SCHEMA IF NOT EXISTS #{schema}"
    execute "CREATE EXTENSION IF NOT EXISTS pgcrypto"
    # execute "CREATE EXTENSION IF NOT EXISTS citext"
  end
end
