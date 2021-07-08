defmodule WhackathonPlatformWeb.PageController do
  use WhackathonPlatformWeb, :controller

  def index(conn, _params) do
    conn
    |> put_layout("appnostyling.html")
    |> render("index.html")
  end
end
