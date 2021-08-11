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
    github_link = project_params["github_link"]
    user = Repo.get!(User, user_id)
    project =
      Ecto.build_assoc(user, :projects, title: title, description: description, github_link: github_link)
      |> Project.changeset()
      |> Repo.insert()

    case project do
      {:ok, _project} ->
        conn
        |> redirect(to: Routes.user_path(conn, :show, user.username))
      {:error, changeset} ->
        conn
        |> assign(:project_changeset, changeset)
        |> redirect(to: Routes.user_path(conn, :show, user.username))
    end

    # conn
    # |> redirect(to: Routes.user_path(conn, :show, user.username))
  end
end
