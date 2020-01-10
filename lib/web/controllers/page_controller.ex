defmodule PortisheadWeb.PageController do
  use PortisheadWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
