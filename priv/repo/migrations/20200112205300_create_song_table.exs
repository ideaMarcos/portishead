defmodule Portishead.Repo.Migrations.CreateSongTable do
  use Ecto.Migration

  def change do
    create table(:song) do
      add :title, :string, null: false
      add :band_uuid, references(:band, column: :uuid), null: false
      add :external_id, :uuid, null: false

      add :metadata, :json
      timestamps()
    end
  end
end
