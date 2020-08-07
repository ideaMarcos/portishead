defmodule Portishead.Repo.Migrations.CreateCountryTable do
  use Ecto.Migration

  def change do
    create table(:country, primary_key: false) do
      add :code, :string, primary_key: true, size: 3
      add :name, :string, null: false
    end

    create index(:country, ["lower(code)"], name: :country_index, unique: true)

    flush()

    directory = Application.app_dir(:portishead, "priv/repo")
    file_path = Path.join(directory, "country-codes.csv")
    import_people_from(file_path)
  end

  defp import_people_from(filepath) do
    sql = """
      COPY portishead.country (code, name)
      FROM STDIN
      WITH DELIMITER ',' CSV HEADER
    """

    stream = Ecto.Adapters.SQL.stream(Portishead.Repo, sql)

    Portishead.Repo.transaction(fn ->
      File.stream!(filepath)
      |> Enum.into(stream)
    end)
  end
end
