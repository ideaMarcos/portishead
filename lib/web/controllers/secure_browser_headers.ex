defmodule PortisheadWeb.SecureBrowserHeaders do
  import Phoenix.Controller
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    csp = Application.get_env(:portishead, :content_security_policy, "default-src 'self'")
    x_frame_options = Application.get_env(:portishead, :x_frame_options)

    conn
    |> put_secure_browser_headers()
    |> update_resp_header_if_not_empty("x-frame-options", x_frame_options)
    |> update_resp_header_if_not_empty("content-security-policy", csp)
  end

  defp update_resp_header_if_not_empty(conn, _, ""),
    do: conn

  defp update_resp_header_if_not_empty(conn, _, nil),
    do: conn

  defp update_resp_header_if_not_empty(conn, name, value),
    do: update_resp_header(conn, name, value, fn _ -> value end)
end
