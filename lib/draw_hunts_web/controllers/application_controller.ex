defmodule DrawHuntsWeb.ApplicationController do
  use DrawHuntsWeb, :controller

  alias DrawHunts.HuntDetails
  alias DrawHunts.HuntDetails.Application

  action_fallback DrawHuntsWeb.FallbackController

  def index(conn, _params) do
    applications = HuntDetails.list_applications()
    render(conn, "index.json", applications: applications)
  end

  def create(conn, %{"application" => application_params}) do
    with {:ok, %Application{} = application} <- HuntDetails.create_application(application_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.application_path(conn, :show, application))
      |> render("show.json", application: application)
    end
  end

  def show(conn, %{"id" => id}) do
    application = HuntDetails.get_application!(id)
    render(conn, "show.json", application: application)
  end

  def update(conn, %{"id" => id, "application" => application_params}) do
    application = HuntDetails.get_application!(id)

    with {:ok, %Application{} = application} <- HuntDetails.update_application(application, application_params) do
      render(conn, "show.json", application: application)
    end
  end

  def delete(conn, %{"id" => id}) do
    application = HuntDetails.get_application!(id)

    with {:ok, %Application{}} <- HuntDetails.delete_application(application) do
      send_resp(conn, :no_content, "")
    end
  end
end
