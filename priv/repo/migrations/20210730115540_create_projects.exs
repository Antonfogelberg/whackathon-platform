defmodule WhackathonPlatform.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects, primary_key: true) do
      add :title, :string
      add :description, :text
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

  end
end
