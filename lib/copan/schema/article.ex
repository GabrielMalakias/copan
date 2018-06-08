defmodule Copan.Schema.Article do
  @moduledoc """
  Articles created by users
  """

  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "articles" do
    field(:title, :string)
    field(:image, :string)
    field(:content, :text)
    field(:description, :text)

    belongs_to(:category, Copan.Schema.Category)

    timestamps()
  end
end
