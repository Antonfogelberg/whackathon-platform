defmodule WhackathonPlatformWeb.EventController do
  use WhackathonPlatformWeb, :controller

  alias WhackathonPlatform.Repo
  alias WhackathonPlatform.Event

  def show(conn, %{"id" => id}) do
    try do
      event =
        Event
        |> Repo.get_by!(id: id)
        |> Repo.preload(:attendee)

      render(conn, "show.html", event: event)
    rescue
      _error in Ecto.NoResultsError ->
        text(conn, "No event found with that id")
    end
  end

  def new(conn, _params) do
    changeset = Event.changeset(%Event{}, %{})

    conn
    |> assign(:action, "/events")
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"event" => event_params}) do
    event =
      %Event{}
      |> Event.changeset(event_params)
      |> Repo.insert()

    case event do
      {:ok, event} ->
        conn
        |> redirect(to: Routes.event_path(conn, :show, event.id))

      {:error, changeset} ->
        conn
        |> assign(:action, "/events")
        |> render("new.html", changeset: changeset)
    end
  end

  # Kommer eventuellt behöva göra en ny sida för edit som ser exakt ut som create
  # Skickar tillbaka en lite konstigt just nu till en sak som redan finns?
  def edit(conn, %{"id" => id}) do
    event = Repo.get_by!(Event, id: id)
    changeset = Event.changeset(event, %{})

    conn
    |> assign(:action, "/events")
    |> render("new.html", changeset: changeset)
  end

  def index(conn, _params) do
    events = Repo.all(Event)
    render(conn, "index.html", events: events)
  end
end
