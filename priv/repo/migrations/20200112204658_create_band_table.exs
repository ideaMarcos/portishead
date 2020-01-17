defmodule Portishead.Repo.Migrations.CreateBandTable do
  use Ecto.Migration

  def change do
    create table(:band) do
      add :name, :string, null: false
      add :hometown, :string

      add :metadata, :json
      timestamps()
    end
  end
end