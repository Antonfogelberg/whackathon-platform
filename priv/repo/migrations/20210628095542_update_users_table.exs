defmodule WhackathonPlatform.Repo.Migrations.UpdateUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :username, :string
      add :bio, :string
      add :admin, :boolean, null: false, default: false
    end
  end
end
