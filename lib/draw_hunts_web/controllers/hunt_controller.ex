defmodule DrawHuntsWeb.HuntController do
  use DrawHuntsWeb, :controller

  alias DrawHunts.HuntDetails
  alias DrawHunts.HuntDetails.Hunt

  def index(conn, _params) do
    hunts = HuntDetails.list_hunts()
    render(conn, "index.json", hunts: hunts)
  end
end
