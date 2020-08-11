defmodule DrawHuntsWeb.ApplicationView do
  use DrawHuntsWeb, :view
  alias DrawHuntsWeb.ApplicationView

  def render("index.json", %{applications: applications}) do
    %{data: render_many(applications, ApplicationView, "application.json")}
  end

  def render("show.json", %{application: application}) do
    %{data: render_one(application, ApplicationView, "application.json")}
  end

  def render("application.json", %{application: application}) do
    %{id: application.id,
      won: application.won,
      accepted: application.accepted}
  end
end
