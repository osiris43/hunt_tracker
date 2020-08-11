defmodule DrawHunts.Repo.Migrations.CreateApplications do
  use Ecto.Migration

  def change do
    create table(:applications) do
      add :won, :boolean, default: false, null: false
      add :accepted, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)
      add :hunt_id, references(:hunts, on_delete: :nothing)

      timestamps()
    end

    create index(:applications, [:user_id])
    create index(:applications, [:hunt_id])
  end
end
