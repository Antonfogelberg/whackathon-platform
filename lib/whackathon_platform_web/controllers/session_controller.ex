defmodule WhackathonPlatformWeb.SessionController do
  use WhackathonPlatformWeb, :controller

  def new(conn, _params) do
    changeset = Pow.Plug.change_user(conn)

    conn
    |> assign(:action, "/login")
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    conn
    |> assign(:action, "/login")
    |> Pow.Plug.authenticate_user(user_params)
    |> case do
      {:ok, conn} ->
        conn
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, conn} ->
        changeset = Pow.Plug.change_user(conn, conn.params["user"])

        conn
        |> put_flash(:info, "Invalid email or password")
        |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, _params) do
    conn
    |> Pow.Plug.delete()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
