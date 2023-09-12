defmodule Myphoenix.MyContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Myphoenix.MyContext` context.
  """

  @doc """
  Generate a my_resource.
  """
  def my_resource_fixture(attrs \\ %{}) do
    {:ok, my_resource} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Myphoenix.MyContext.create_my_resource()

    my_resource
  end
end
