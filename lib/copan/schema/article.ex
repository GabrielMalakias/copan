defmodule Copan.Schema.Article do
  @moduledoc """
  Articles created by users
  """

  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "articles" do
    field(:title, :string)
    field(:image, :string)
    field(:content, :string)
    field(:description, :string)

    belongs_to(:category, Copan.Schema.Category)

    timestamps()
  end
end
