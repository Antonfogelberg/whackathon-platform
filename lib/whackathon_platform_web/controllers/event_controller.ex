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

  def get_month(month) do
    case month do
      1 ->
        "Jan"
      2 ->
        "Feb"
      3 ->
        "Mar"
      4 ->
        "Apr"
      5 ->
        "May"
      6 ->
        "Jun"
      7 ->
        "Jul"
      8 ->
        "Aug"
      9 ->
        "Sep"
      10 ->
        "Oct"
      11 ->
        "Nov"
      12 ->
        "Dec"
      _ ->
        ""
    end
  end

  def get_day_of_week(day) do
    case day do
      1 ->
        "Mon"
      2 ->
        "Tue"
      3 ->
        "Wed"
      4 ->
        "Thu"
      5 ->
        "Fri"
      6 ->
        "Sat"
      7 ->
        "Sun"
    end
  end

def get_formatted_time(time) do
  case time do
    0 ->
      "00"
    1 ->
      "01"
    2 ->
      "02"
    3 ->
      "03"
    4 ->
      "04"
    5 ->
      "05"
    6 ->
      "06"
    7 ->
      "07"
    8 ->
      "08"
    9 ->
      "09"
    _ ->
      time
  end
end
end
