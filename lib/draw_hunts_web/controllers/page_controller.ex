defmodule DrawHuntsWeb.PageController do
  use DrawHuntsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
