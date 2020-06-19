defmodule Portishead.Repo.Migrations.CreateBandTable do
  use Ecto.Migration

  def change do
    create table(:band) do
      add :name, :string, null: false
      add :country_code, references(:country, column: :code, type: :string), null: false, size: 3

      add :metadata, :json
      timestamps()
    end
  end
end
