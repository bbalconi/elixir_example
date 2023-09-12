defmodule Myphoenix.MyContext.MyResource do
  use Ecto.Schema
  import Ecto.Changeset

  schema "my_resources" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(my_resource, attrs) do
    my_resource
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
