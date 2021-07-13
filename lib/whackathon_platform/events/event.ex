defmodule WhackathonPlatform.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :name, :string
    field :description, :string
    field :theme, :string
    field :start_time, :utc_datetime
    field :end_time, :utc_datetime
    has_many :attendee, WhackathonPlatform.Users.User

    timestamps()
  end

  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> cast(attrs, [:name, :description, :theme, :start_time, :end_time])
    |> validate_required([:name, :description, :theme, :start_time, :end_time])
    |> unique_constraint(:name)
  end
end
