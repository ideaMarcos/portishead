defmodule PortisheadWeb.ApiFallbackController do
  use PortisheadWeb, :controller
  import Plug.Conn

  # https://hexdocs.pm/phoenix/Phoenix.Controller.html#action_fallback/1

  def call(conn, {:error, error}) when is_atom(error) do
    msg = error |> Atom.to_string() |> String.replace("_", " ")
    send_error_resp(conn, msg)
  end

  def call(conn, _error) do
    send_error_resp(conn, "internal server error")
  end

  def send_error_resp(conn, error, status \\ 400) do
    IO.write(:stderr, error)
    body = Jason.encode!(%{error: error})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(status, body)
    |> halt()
  end
end
