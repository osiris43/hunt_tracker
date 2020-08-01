defmodule DrawHuntsWeb.CategoryView do
  use DrawHuntsWeb, :view
  alias DrawHuntsWeb.CategoryView

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{id: category.id,
      deadline: category.deadline,
      category: category.description}
  end
end
