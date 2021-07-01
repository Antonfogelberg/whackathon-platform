defmodule WhackathonPlatformWeb.PageController do
  use WhackathonPlatformWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
