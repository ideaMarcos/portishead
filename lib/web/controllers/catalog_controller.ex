defmodule PortisheadWeb.CatalogController do
  use PortisheadWeb, :controller

  alias Portishead.Catalog
  alias PortisheadWeb.BandView

  def index(conn, _params) do
    bands = Catalog.list_bands()
    render(conn, BandView, "bands.json", bands: bands)
  end
end
