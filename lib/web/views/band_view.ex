defmodule PortisheadWeb.BandView do
  use PortisheadWeb, :view

  def render("bands.json", %{bands: bands}) do
    render_many(bands, __MODULE__, "band.json")
  end

  def render("band.json", %{band: band}) do
    %{
      name: band.name,
      hometown: band.hometown,
      inserted_at: band.inserted_at,
      updated_at: band.updated_at
    }
  end
end
