defmodule CopanWeb.Schema.Category do
  use Absinthe.Schema.Notation

  object :category do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :position, non_null(:integer)
  end

  object :category_queries do
    field :categories, list_of(non_null(:category)) do
      resolve &Copan.Resolvers.Category.all/3
    end
  end
end
