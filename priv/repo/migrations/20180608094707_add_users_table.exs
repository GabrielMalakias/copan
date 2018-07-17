defmodule Copan.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def up do
    create table("users") do
      add :name, :string
      add :email, :string
      add :reference_id, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:reference_id])
  end

  def down do
    drop table("users")
  end
end
