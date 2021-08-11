defmodule WhackathonPlatformWeb.UserController do
  use WhackathonPlatformWeb, :controller

  alias WhackathonPlatform.Repo
  alias WhackathonPlatform.Users.User
  alias WhackathonPlatform.Project

  def show(conn, %{"id" => id}) do
    try do
      # user = Repo.get_by!(User, username: id)
      user =
        User
        |> Repo.get_by!(username: id)
        |> Repo.preload(:projects)
      project_changeset = Project.changeset(%Project{})
      render(conn, "show.html", user: user, project_changeset: project_changeset)
    rescue
      _error in Ecto.NoResultsError ->
        text(conn, "No such user")
    end
  end
end
