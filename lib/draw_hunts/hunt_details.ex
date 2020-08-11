defmodule DrawHunts.HuntDetails do
  @moduledoc """
  The HuntDetails context.
  """

  import Ecto.Query, warn: false
  alias DrawHunts.Repo

  alias DrawHunts.HuntDetails.Hunt
  alias DrawHunts.HuntDetails.Category

  @doc """
  Returns the list of hunts.

  ## Examples

      iex> list_hunts()
      [%Hunt{}, ...]

  """
  def list_hunts do
    query = from h in Hunt,
      select: h,
      limit: 5,
      order_by: :start_date

    Repo.all(query)
  end

  @doc """
  Gets a single hunt.

  Raises if the Hunt does not exist.

  ## Examples

      iex> get_hunt!(123)
      %Hunt{}

  """
  def get_hunt!(id), do: raise "TODO"

  @doc """
  Creates a hunt.

  ## Examples

      iex> create_hunt(%{field: value})
      {:ok, %Hunt{}}

      iex> create_hunt(%{field: bad_value})
      {:error, ...}

  """
  def create_hunt(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a hunt.

  ## Examples

      iex> update_hunt(hunt, %{field: new_value})
      {:ok, %Hunt{}}

      iex> update_hunt(hunt, %{field: bad_value})
      {:error, ...}

  """
  def update_hunt(%Hunt{} = hunt, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Hunt.

  ## Examples

      iex> delete_hunt(hunt)
      {:ok, %Hunt{}}

      iex> delete_hunt(hunt)
      {:error, ...}

  """
  def delete_hunt(%Hunt{} = hunt) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking hunt changes.

  ## Examples

      iex> change_hunt(hunt)
      %Todo{...}

  """
  def change_hunt(%Hunt{} = hunt) do
    raise "TODO"
  end


  @doc """
  Returns the list of hunt categories.

  ## Examples

      iex> list_hunt_categories()
      [%Category{}, ...]

  """
  def list_hunt_categories do
    now = DateTime.utc_now()
    query = from hc in Category,
      where: hc.deadline > ^now,
      select: hc,
      limit: 5,
      order_by: :deadline

    Repo.all(query)
  end

  alias DrawHunts.HuntDetails.Application

  @doc """
  Returns the list of applications.

  ## Examples

      iex> list_applications()
      [%Application{}, ...]

  """
  def list_applications do
    Repo.all(Application)
  end

  @doc """
  Gets a single application.

  Raises `Ecto.NoResultsError` if the Application does not exist.

  ## Examples

      iex> get_application!(123)
      %Application{}

      iex> get_application!(456)
      ** (Ecto.NoResultsError)

  """
  def get_application!(id), do: Repo.get!(Application, id)

  @doc """
  Creates a application.

  ## Examples

      iex> create_application(%{field: value})
      {:ok, %Application{}}

      iex> create_application(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_application(attrs \\ %{}) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a application.

  ## Examples

      iex> update_application(application, %{field: new_value})
      {:ok, %Application{}}

      iex> update_application(application, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_application(%Application{} = application, attrs) do
    application
    |> Application.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a application.

  ## Examples

      iex> delete_application(application)
      {:ok, %Application{}}

      iex> delete_application(application)
      {:error, %Ecto.Changeset{}}

  """
  def delete_application(%Application{} = application) do
    Repo.delete(application)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking application changes.

  ## Examples

      iex> change_application(application)
      %Ecto.Changeset{source: %Application{}}

  """
  def change_application(%Application{} = application) do
    Application.changeset(application, %{})
  end
end
