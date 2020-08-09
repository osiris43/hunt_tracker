defmodule DrawHuntsWeb.Router do
  use DrawHuntsWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DrawHuntsWeb do
    pipe_through :api

    get "/hunts", HuntController, :index
    get "/categories", CategoryController, :index
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/", DrawHuntsWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", DrawHuntsWeb do
  #   pipe_through :api
  # end
end
