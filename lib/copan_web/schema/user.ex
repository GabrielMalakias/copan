defmodule CopanWeb.Schema.User do
  use Absinthe.Schema.Notation

  object :user do
    field :id, non_null(:id)
    field :name, :string
    field :email, :string
  end

  object :user_queries do
    field :users, non_null(list_of(non_null(:user))) do
      resolve &Copan.Resolvers.User.all/3
    end
  end
end
