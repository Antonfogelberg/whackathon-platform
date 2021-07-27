defmodule WhackathonPlatform.Repo.Migrations.UpdateUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :username, :string
      add :event_id, :id
      add :bio, :text
      add :admin, :boolean, null: false, default: false
      add :profile_pic, :binary
    end
  end
end
