defmodule DrawHuntsWeb.HuntView do
  use DrawHuntsWeb, :view
  alias DrawHuntsWeb.HuntView

  def render("index.json", %{hunts: hunts}) do
    %{data: render_many(hunts, HuntView, "hunt.json")}
  end

  def render("hunt.json", %{hunt: hunt}) do
    %{id: hunt.id,
      location: hunt.location,
      start_date: hunt.start_date,
      category: hunt.category}
  end
end
