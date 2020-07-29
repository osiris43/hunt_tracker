defmodule DrawHunts.HuntDetails do
  @moduledoc """
  The HuntDetails context.
  """

  import Ecto.Query, warn: false
  alias DrawHunts.Repo

  alias DrawHunts.HuntDetails.Hunt

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
end
