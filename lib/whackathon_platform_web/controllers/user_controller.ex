defmodule WhackathonPlatformWeb.UserController do
  use WhackathonPlatformWeb, :controller

  def show(conn, _params) do
    render(conn, "show.html")
  end
end
