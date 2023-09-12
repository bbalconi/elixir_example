defmodule MyphoenixWeb.MyResourceController do
  use MyphoenixWeb, :controller

  alias Myphoenix.MyContext
  alias Myphoenix.MyContext.MyResource

  action_fallback MyphoenixWeb.FallbackController

  def index(conn, _params) do
    my_resources = MyContext.list_my_resources()
    render(conn, :index, my_resources: my_resources)
  end

  def create(conn, %{"my_resource" => my_resource_params}) do
    with {:ok, %MyResource{} = my_resource} <- MyContext.create_my_resource(my_resource_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/my_resources/#{my_resource}")
      |> render(:show, my_resource: my_resource)
    end
  end

  def show(conn, %{"id" => id}) do
    my_resource = MyContext.get_my_resource!(id)
    render(conn, :show, my_resource: my_resource)
  end

  def update(conn, %{"id" => id, "my_resource" => my_resource_params}) do
    my_resource = MyContext.get_my_resource!(id)

    with {:ok, %MyResource{} = my_resource} <- MyContext.update_my_resource(my_resource, my_resource_params) do
      render(conn, :show, my_resource: my_resource)
    end
  end

  def delete(conn, %{"id" => id}) do
    my_resource = MyContext.get_my_resource!(id)

    with {:ok, %MyResource{}} <- MyContext.delete_my_resource(my_resource) do
      send_resp(conn, :no_content, "")
    end
  end
end
