defmodule Copan.Repo.Migrations.AddArticlesTable do
  use Ecto.Migration

  def up do
    create table("articles") do
      add :title, :string
      add :image, :string
      add :content, :string
      add :description, :string
      add :category_id, references(:categories)

      timestamps()
    end
  end

  def down do
    drop table("articles")
  end
end
