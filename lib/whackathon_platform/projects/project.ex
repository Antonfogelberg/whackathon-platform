defmodule WhackathonPlatform.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias WhackathonPlatform.Users.User

  @primary_key {:id, :id, autogenerate: true}
  @foreign_key_type :id
  schema "projects" do
    field :description, :string
    field :title, :string
    field :github_link, :string
    belongs_to :user, User

    timestamps()
  end

  @doc """
  Creates a new Project struct
  """
  def new(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
  end

  @doc """
  This documentation is to avoid unnecessary gotcha
  """
  def changeset(project, attrs \\ %{}) do
    project
    |> cast(attrs, [:title, :description, :user_id, :github_link])
    |> validate_required([:title, :description, :user_id])
  end
end
