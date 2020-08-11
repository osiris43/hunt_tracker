defmodule DrawHuntsWeb.ApplicationControllerTest do
  use DrawHuntsWeb.ConnCase

  alias DrawHunts.HuntDetails
  alias DrawHunts.HuntDetails.Application

  @create_attrs %{
    accepted: true,
    won: true
  }
  @update_attrs %{
    accepted: false,
    won: false
  }
  @invalid_attrs %{accepted: nil, won: nil}

  def fixture(:application) do
    {:ok, application} = HuntDetails.create_application(@create_attrs)
    application
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all applications", %{conn: conn} do
      conn = get(conn, Routes.application_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create application" do
    test "renders application when data is valid", %{conn: conn} do
      conn = post(conn, Routes.application_path(conn, :create), application: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.application_path(conn, :show, id))

      assert %{
               "id" => id,
               "accepted" => true,
               "won" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.application_path(conn, :create), application: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update application" do
    setup [:create_application]

    test "renders application when data is valid", %{conn: conn, application: %Application{id: id} = application} do
      conn = put(conn, Routes.application_path(conn, :update, application), application: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.application_path(conn, :show, id))

      assert %{
               "id" => id,
               "accepted" => false,
               "won" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, application: application} do
      conn = put(conn, Routes.application_path(conn, :update, application), application: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete application" do
    setup [:create_application]

    test "deletes chosen application", %{conn: conn, application: application} do
      conn = delete(conn, Routes.application_path(conn, :delete, application))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.application_path(conn, :show, application))
      end
    end
  end

  defp create_application(_) do
    application = fixture(:application)
    {:ok, application: application}
  end
end
