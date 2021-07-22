defmodule WhackathonPlatform.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  use PowAssent.Ecto.Schema

  use Pow.Extension.Ecto.Schema,
    extensions: [PowResetPassword]

  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :event_id, :id
    field :bio, :string
    field :admin, :boolean, null: false, default: false
    field :profile_pic, :binary
    pow_user_fields()

    timestamps()
  end

  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> pow_changeset(attrs)
    |> pow_extension_changeset(attrs)
    |> cast(attrs, [:username, :admin])
    |> validate_required([:username, :admin])
    |> unique_constraint(:username)
  end
end
