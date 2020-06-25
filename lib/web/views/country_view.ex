defmodule PortisheadWeb.CountryView do
  use PortisheadWeb, :view

  def render("countries.json", %{countries: countries}) do
    render_many(countries, __MODULE__, "country.json")
  end

  def render("country.json", %{country: country}) do
    %{
      code: country.code,
      name: country.name
    }
  end
end
