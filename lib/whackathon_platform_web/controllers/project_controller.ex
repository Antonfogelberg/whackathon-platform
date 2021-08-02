defmodule WhackathonPlatformWeb.ProjectController do
  use WhackathonPlatformWeb, :controller

  alias WhackathonPlatform.Repo
  alias WhackathonPlatform.Project

  def index(conn, _params) do
    projects = Repo.all(Project)
    render(conn, "index.html", projects: projects)
  end
end
