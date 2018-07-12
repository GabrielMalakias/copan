defmodule CopanWeb.Schema do
  use Absinthe.Schema

  import_types CopanWeb.Schema.User
  import_types CopanWeb.Schema.Article
  import_types CopanWeb.Schema.Category

  input_object :scope do
    field :user_id, :string
  end

  query do
    import_fields :user_queries
    import_fields :article_queries
    import_fields :category_queries
  end
end
