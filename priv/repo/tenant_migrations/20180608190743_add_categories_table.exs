defmodule Copan.Repo.Migrations.AddCategoriesTable do
  use Ecto.Migration

  def up do
    create table("categories") do
      add :name, :string
      add :position, :integer
    end
  end

  def down do
    drop table("categories")
  end
end
