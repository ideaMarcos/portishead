defmodule Portishead.Repo.Migrations.CreateSongTable do
  use Ecto.Migration

  def change do
    create table(:song) do
      add :title, :string
      add :band_uuid, references(:band, column: :uuid)

      add :metadata, :json
      timestamps()
    end
  end
end
