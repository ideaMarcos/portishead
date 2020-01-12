defmodule Portishead.Repo.Migrations.CreateSchema do
  use Ecto.Migration

  def change do
    execute "CREATE SCHEMA premarcos"
  end
end
