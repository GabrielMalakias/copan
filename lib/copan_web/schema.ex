defmodule CopanWeb.Schema do
  use Absinthe.Schema


  object :category do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :position, non_null(:integer)
  end

  query do
    field :all_categories, non_null(list_of(non_null(:category))) do
      arg :user_id, non_null(:id)

      resolve &Copan.Resolvers.Category.all_categories/3
    end
  end
end
