defmodule WhackathonPlatformWeb.UserController do
  use WhackathonPlatformWeb, :controller

  require Logger

  alias WhackathonPlatform.Repo
  alias WhackathonPlatform.Users.User

  def show(conn, %{"id" => id}) do
    Logger.debug(id)
    try do
      %{email: email} = Repo.get!(User, id)
      render(conn, "show.html", email: email)
    rescue
      _error in Ecto.NoResultsError ->
        text(conn, "No such user")
    end
  end
end
