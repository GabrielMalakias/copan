defmodule CopanWeb.Schema do
  use Absinthe.Schema


  object :category do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :position, non_null(:integer)
  end

  object :article do
    field :id, non_null(:id)
    field :title, :string
    field :image, :string
    field :content,:string
    field :description, :string
  end

  object :user do
    field :id, non_null(:id)
    field :name, :string
    field :email, :string
  end

  input_object :filter do
    field :user_id, :string
  end

  query do
    field :categories, non_null(list_of(non_null(:category))) do
      arg :filter, non_null(:filter)

      resolve &Copan.Resolvers.Category.all/3
    end

    field :articles, non_null(list_of(non_null(:article))) do
      arg :filter, non_null(:filter)

      resolve &Copan.Resolvers.Article.all/3
    end

    field :users, non_null(list_of(non_null(:user))) do
      resolve &Copan.Resolvers.User.all/3
    end
  end
end
