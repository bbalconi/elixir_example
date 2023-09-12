defmodule MyphoenixWeb.MyResourceJSON do
  alias Myphoenix.MyContext.MyResource

  @doc """
  Renders a list of my_resources.
  """
  def index(%{my_resources: my_resources}) do
    %{data: for(my_resource <- my_resources, do: data(my_resource))}
  end

  @doc """
  Renders a single my_resource.
  """
  def show(%{my_resource: my_resource}) do
    %{data: data(my_resource)}
  end

  defp data(%MyResource{} = my_resource) do
    %{
      id: my_resource.id,
      name: my_resource.name
    }
  end
end
