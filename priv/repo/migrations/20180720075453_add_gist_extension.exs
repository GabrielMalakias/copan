defmodule Copan.Repo.Migrations.AddGistExtension do
  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS btree_gist")
  end

  def down do
    execute("DROP EXTENSION IF EXISTS btree_gist")
  end
end
