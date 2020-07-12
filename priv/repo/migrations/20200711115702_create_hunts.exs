defmodule DrawHunts.Repo.Migrations.CreateHunts do
  use Ecto.Migration

  def change do
    create table(:hunts) do
      add :type, :string
      add :category, :string
      add :start_date, :date
      add :end_date, :date
      add :location, :string
      add :bag_limit, {:array, :string}
      add :means, :string
      add :method, :string
      add :baiting, :boolean, default: false, null: false
      add :permits, :integer
      add :fee, :integer
      add :previous_year_applicants, :integer
      add :previous_year_permits, :integer
      add :previous_year_success, :integer

      timestamps()
    end

  end
end
