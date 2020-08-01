defmodule DrawHunts.Repo.Migrations.CreateHuntCategories do
  use Ecto.Migration

  def change do
    create table(:hunt_categories) do
      add :description, :string
      add :deadline, :date

      timestamps()
    end

  end
end
