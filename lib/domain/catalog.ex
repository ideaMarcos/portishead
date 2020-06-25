defmodule Portishead.Catalog do
  import Ecto.Query, warn: false

  alias Portishead.Repo
  alias Portishead.Schema.Band
  alias Portishead.Schema.Country

  def list_bands do
    Band
    |> order_by(:name)
    |> Repo.all()
  end

  def get_band!(id), do: Repo.get!(Band, id)

  def create_band(attrs \\ %{}) do
    %Band{}
    |> Band.changeset(attrs)
    |> Repo.insert()
  end

  def update_band(%Band{} = band, attrs) do
    band
    |> Band.changeset(attrs)
    |> Repo.update()
  end

  def delete_band(%Band{} = band) do
    Repo.delete(band)
  end

  def change_band(%Band{} = band) do
    Band.changeset(band, %{})
  end

  def list_countries do
    Country
    |> order_by(:name)
    |> Repo.all()
  end
end
