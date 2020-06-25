defmodule PortisheadWeb.BandController do
  use PortisheadWeb, :controller

  action_fallback PortisheadWeb.ApiFallbackController

  alias Portishead.Catalog
  alias PortisheadWeb.BandView

  def index(conn, _params) do
    bands = Catalog.list_bands()

    conn
    |> put_view(BandView)
    |> render("bands.json", bands: bands)
  end
end
