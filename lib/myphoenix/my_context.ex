defmodule Myphoenix.MyContext do
  @moduledoc """
  The MyContext context.
  """

  import Ecto.Query, warn: false
  alias Myphoenix.Repo

  alias Myphoenix.MyContext.MyResource

  @doc """
  Returns the list of my_resources.

  ## Examples

      iex> list_my_resources()
      [%MyResource{}, ...]

  """
  def list_my_resources do
    Repo.all(MyResource)
  end

  @doc """
  Gets a single my_resource.

  Raises `Ecto.NoResultsError` if the My resource does not exist.

  ## Examples

      iex> get_my_resource!(123)
      %MyResource{}

      iex> get_my_resource!(456)
      ** (Ecto.NoResultsError)

  """
  def get_my_resource!(id), do: Repo.get!(MyResource, id)

  @doc """
  Creates a my_resource.

  ## Examples

      iex> create_my_resource(%{field: value})
      {:ok, %MyResource{}}

      iex> create_my_resource(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_my_resource(attrs \\ %{}) do
    %MyResource{}
    |> MyResource.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a my_resource.

  ## Examples

      iex> update_my_resource(my_resource, %{field: new_value})
      {:ok, %MyResource{}}

      iex> update_my_resource(my_resource, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_my_resource(%MyResource{} = my_resource, attrs) do
    my_resource
    |> MyResource.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a my_resource.

  ## Examples

      iex> delete_my_resource(my_resource)
      {:ok, %MyResource{}}

      iex> delete_my_resource(my_resource)
      {:error, %Ecto.Changeset{}}

  """
  def delete_my_resource(%MyResource{} = my_resource) do
    Repo.delete(my_resource)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking my_resource changes.

  ## Examples

      iex> change_my_resource(my_resource)
      %Ecto.Changeset{data: %MyResource{}}

  """
  def change_my_resource(%MyResource{} = my_resource, attrs \\ %{}) do
    MyResource.changeset(my_resource, attrs)
  end
end
