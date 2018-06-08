defmodule Copan.Schema.Category do
  @moduledoc """
  Basically the tenants list
  """

  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "categories" do
    field(:name, :string)
    field(:position, :integer)

    has_many(:articles, Copan.Schema.Article)

    timestamps()
  end
end
