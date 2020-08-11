defmodule DrawHunts.HuntDetails.Application do
  use Ecto.Schema
  import Ecto.Changeset

  schema "applications" do
    field :accepted, :boolean, default: false
    field :won, :boolean, default: false
    field :user_id, :id
    field :hunt_id, :id

    timestamps()
  end

  @doc false
  def changeset(application, attrs) do
    application
    |> cast(attrs, [:won, :accepted])
    |> validate_required([:won, :accepted])
  end
end
