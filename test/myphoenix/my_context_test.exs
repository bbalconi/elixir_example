defmodule Myphoenix.MyContextTest do
  use Myphoenix.DataCase

  alias Myphoenix.MyContext

  describe "my_resources" do
    alias Myphoenix.MyContext.MyResource

    import Myphoenix.MyContextFixtures

    @invalid_attrs %{name: nil}

    test "list_my_resources/0 returns all my_resources" do
      my_resource = my_resource_fixture()
      assert MyContext.list_my_resources() == [my_resource]
    end

    test "get_my_resource!/1 returns the my_resource with given id" do
      my_resource = my_resource_fixture()
      assert MyContext.get_my_resource!(my_resource.id) == my_resource
    end

    test "create_my_resource/1 with valid data creates a my_resource" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %MyResource{} = my_resource} = MyContext.create_my_resource(valid_attrs)
      assert my_resource.name == "some name"
    end

    test "create_my_resource/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MyContext.create_my_resource(@invalid_attrs)
    end

    test "update_my_resource/2 with valid data updates the my_resource" do
      my_resource = my_resource_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %MyResource{} = my_resource} = MyContext.update_my_resource(my_resource, update_attrs)
      assert my_resource.name == "some updated name"
    end

    test "update_my_resource/2 with invalid data returns error changeset" do
      my_resource = my_resource_fixture()
      assert {:error, %Ecto.Changeset{}} = MyContext.update_my_resource(my_resource, @invalid_attrs)
      assert my_resource == MyContext.get_my_resource!(my_resource.id)
    end

    test "delete_my_resource/1 deletes the my_resource" do
      my_resource = my_resource_fixture()
      assert {:ok, %MyResource{}} = MyContext.delete_my_resource(my_resource)
      assert_raise Ecto.NoResultsError, fn -> MyContext.get_my_resource!(my_resource.id) end
    end

    test "change_my_resource/1 returns a my_resource changeset" do
      my_resource = my_resource_fixture()
      assert %Ecto.Changeset{} = MyContext.change_my_resource(my_resource)
    end
  end
end
