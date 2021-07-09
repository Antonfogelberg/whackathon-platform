defmodule WhackathonPlatform.Event do
  use Ecto.Schema

  schema "events" do
    field :name, :string
    field :description, :string
    field :theme, :string
    field :start_time, :utc_datetime
    field :end_time, :utc_datetime
    has_many :attendee, WhackathonPlatform.Users.User
  end
end
