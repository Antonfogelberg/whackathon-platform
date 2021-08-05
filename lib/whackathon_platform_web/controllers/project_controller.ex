defmodule WhackathonPlatformWeb.ProjectController do
  use WhackathonPlatformWeb, :controller

  alias WhackathonPlatform.Repo
  alias WhackathonPlatform.Project
  alias WhackathonPlatform.Users.User

  def index(conn, _params) do
    projects = Repo.all(Project)
    render(conn, "index.html", projects: projects)
  end

  def create(conn, %{"project" => project_params, "user_id" => user_id}) do
    title = project_params["title"]
    description = project_params["description"]
    user = Repo.get!(User, user_id)
    project_changeset = Ecto.build_assoc(user, :projects, title: title, description: description)
    Repo.insert!(project_changeset)

    conn
    |> redirect(to: Routes.user_path(conn, :show, user.username))
  end
end
