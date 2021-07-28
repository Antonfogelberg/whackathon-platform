defmodule WhackathonPlatformWeb.UserController do
  use WhackathonPlatformWeb, :controller

  alias WhackathonPlatform.Repo
  alias WhackathonPlatform.Users.User

  def show(conn, %{"id" => id}) do
    try do
      user = Repo.get_by!(User, username: id)
      render(conn, "show.html", user: user)
    rescue
      _error in Ecto.NoResultsError ->
        text(conn, "No such user")
    end
  end
end
