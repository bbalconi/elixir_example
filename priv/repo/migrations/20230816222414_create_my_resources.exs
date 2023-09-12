defmodule Myphoenix.Repo.Migrations.CreateMyResources do
  use Ecto.Migration

  def change do
    create table(:my_resources) do
      add :name, :string

      timestamps()
    end
  end
end
