defmodule PortisheadWeb.BandView do
  use PortisheadWeb, :view

  def render("bands.json", %{bands: bands}) do
    render_many(bands, __MODULE__, "band.json")
  end

  def render("band.json", %{band: band}) do
    %{
      name: band.name,
      country_code: band.country_code,
      inserted_at: band.inserted_at,
      updated_at: band.updated_at
    }
  end
end
