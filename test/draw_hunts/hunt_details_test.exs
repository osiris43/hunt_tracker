defmodule DrawHunts.HuntDetailsTest do
  use DrawHunts.DataCase

  alias DrawHunts.HuntDetails

  describe "hunts" do
    alias DrawHunts.HuntDetails.Hunt

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def hunt_fixture(attrs \\ %{}) do
      {:ok, hunt} =
        attrs
        |> Enum.into(@valid_attrs)
        |> HuntDetails.create_hunt()

      hunt
    end

    test "list_hunts/0 returns all hunts" do
      hunt = hunt_fixture()
      assert HuntDetails.list_hunts() == [hunt]
    end

    test "get_hunt!/1 returns the hunt with given id" do
      hunt = hunt_fixture()
      assert HuntDetails.get_hunt!(hunt.id) == hunt
    end

    test "create_hunt/1 with valid data creates a hunt" do
      assert {:ok, %Hunt{} = hunt} = HuntDetails.create_hunt(@valid_attrs)
    end

    test "create_hunt/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HuntDetails.create_hunt(@invalid_attrs)
    end

    test "update_hunt/2 with valid data updates the hunt" do
      hunt = hunt_fixture()
      assert {:ok, %Hunt{} = hunt} = HuntDetails.update_hunt(hunt, @update_attrs)
    end

    test "update_hunt/2 with invalid data returns error changeset" do
      hunt = hunt_fixture()
      assert {:error, %Ecto.Changeset{}} = HuntDetails.update_hunt(hunt, @invalid_attrs)
      assert hunt == HuntDetails.get_hunt!(hunt.id)
    end

    test "delete_hunt/1 deletes the hunt" do
      hunt = hunt_fixture()
      assert {:ok, %Hunt{}} = HuntDetails.delete_hunt(hunt)
      assert_raise Ecto.NoResultsError, fn -> HuntDetails.get_hunt!(hunt.id) end
    end

    test "change_hunt/1 returns a hunt changeset" do
      hunt = hunt_fixture()
      assert %Ecto.Changeset{} = HuntDetails.change_hunt(hunt)
    end
  end

  describe "applications" do
    alias DrawHunts.HuntDetails.Application

    @valid_attrs %{accepted: true, won: true}
    @update_attrs %{accepted: false, won: false}
    @invalid_attrs %{accepted: nil, won: nil}

    def application_fixture(attrs \\ %{}) do
      {:ok, application} =
        attrs
        |> Enum.into(@valid_attrs)
        |> HuntDetails.create_application()

      application
    end

    test "list_applications/0 returns all applications" do
      application = application_fixture()
      assert HuntDetails.list_applications() == [application]
    end

    test "get_application!/1 returns the application with given id" do
      application = application_fixture()
      assert HuntDetails.get_application!(application.id) == application
    end

    test "create_application/1 with valid data creates a application" do
      assert {:ok, %Application{} = application} = HuntDetails.create_application(@valid_attrs)
      assert application.accepted == true
      assert application.won == true
    end

    test "create_application/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HuntDetails.create_application(@invalid_attrs)
    end

    test "update_application/2 with valid data updates the application" do
      application = application_fixture()
      assert {:ok, %Application{} = application} = HuntDetails.update_application(application, @update_attrs)
      assert application.accepted == false
      assert application.won == false
    end

    test "update_application/2 with invalid data returns error changeset" do
      application = application_fixture()
      assert {:error, %Ecto.Changeset{}} = HuntDetails.update_application(application, @invalid_attrs)
      assert application == HuntDetails.get_application!(application.id)
    end

    test "delete_application/1 deletes the application" do
      application = application_fixture()
      assert {:ok, %Application{}} = HuntDetails.delete_application(application)
      assert_raise Ecto.NoResultsError, fn -> HuntDetails.get_application!(application.id) end
    end

    test "change_application/1 returns a application changeset" do
      application = application_fixture()
      assert %Ecto.Changeset{} = HuntDetails.change_application(application)
    end
  end
end
