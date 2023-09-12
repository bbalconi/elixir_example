defmodule MyphoenixWeb.MyResourceControllerTest do
  use MyphoenixWeb.ConnCase

  import Myphoenix.MyContextFixtures

  alias Myphoenix.MyContext.MyResource

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all my_resources", %{conn: conn} do
      conn = get(conn, ~p"/api/my_resources")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create my_resource" do
    test "renders my_resource when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/my_resources", my_resource: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/my_resources/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/my_resources", my_resource: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update my_resource" do
    setup [:create_my_resource]

    test "renders my_resource when data is valid", %{conn: conn, my_resource: %MyResource{id: id} = my_resource} do
      conn = put(conn, ~p"/api/my_resources/#{my_resource}", my_resource: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/my_resources/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, my_resource: my_resource} do
      conn = put(conn, ~p"/api/my_resources/#{my_resource}", my_resource: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete my_resource" do
    setup [:create_my_resource]

    test "deletes chosen my_resource", %{conn: conn, my_resource: my_resource} do
      conn = delete(conn, ~p"/api/my_resources/#{my_resource}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/my_resources/#{my_resource}")
      end
    end
  end

  defp create_my_resource(_) do
    my_resource = my_resource_fixture()
    %{my_resource: my_resource}
  end
end
