defmodule DrawHuntsWeb.CategoryController do
  use DrawHuntsWeb, :controller

  alias DrawHunts.HuntDetails
  alias DrawHunts.HuntDetails.Category

  def index(conn, _params) do
    categories = HuntDetails.list_hunt_categories()
    render(conn, "index.json", categories: categories)
  end
end
