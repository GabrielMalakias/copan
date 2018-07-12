defmodule CopanWeb.Schema.Article do
  use Absinthe.Schema.Notation

  object :article do
    field :id, non_null(:id)
    field :title, :string
    field :image, :string
    field :content,:string
    field :description, :string
    field :extra, :string
  end

  query do
    field :articles, non_null(list_of(non_null(:article))) do
      arg :filter, non_null(:filter)

      resolve &Copan.Resolvers.Article.all/3
    end
  end
end
