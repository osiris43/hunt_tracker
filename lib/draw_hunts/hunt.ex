defmodule DrawHunts.Hunt do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hunts" do
    field :bag_limit, {:array, :string}
    field :baiting, :boolean, default: false
    field :category, :string
    field :end_date, :date
    field :fee, :integer
    field :location, :string
    field :means, :string
    field :method, :string
    field :permits, :integer
    field :previous_year_applicants, :integer
    field :previous_year_permits, :integer
    field :previous_year_success, :integer
    field :start_date, :date
    field :type, :string
    field :alldates, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(hunt, attrs) do
    hunt
    |> cast(attrs, [:type, :category, :start_date, :end_date, :location, :bag_limit, :means, :method, :baiting, :permits, :fee, :previous_year_applicants, :previous_year_permits, :previous_year_success, :alldates])
    |> validate_required([:type, :category, :start_date, :end_date, :location, :bag_limit, :method, :permits, :fee])
  end

end
