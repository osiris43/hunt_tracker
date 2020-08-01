defmodule DrawHunts.HuntDetails.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hunt_categories" do
    field :deadline, :date
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:description, :deadline])
    |> validate_required([:description, :deadline])
  end
end
