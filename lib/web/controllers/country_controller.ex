defmodule PortisheadWeb.CountryController do
  use PortisheadWeb, :controller

  action_fallback PortisheadWeb.ApiFallbackController

  alias Portishead.Catalog
  alias PortisheadWeb.CountryView

  def index(conn, _params) do
    countries = Catalog.list_countries()

    conn
    |> put_view(CountryView)
    |> render("countries.json", countries: countries)
  end
end
