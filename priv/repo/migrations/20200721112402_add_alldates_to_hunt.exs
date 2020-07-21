defmodule DrawHunts.Repo.Migrations.AddAlldatesToHunt do
  use Ecto.Migration

  def change do
    alter table(:hunts) do
      add :alldates, {:array, :string}
    end
  end
end
