defmodule CopanWeb.Schema do
  use Absinthe.Schema

  import_types CopanWeb.Schema.User
  import_types CopanWeb.Schema.Article
  import_types CopanWeb.Schema.Category

  query do
    import_fields :user_queries
    import_fields :article_queries
    import_fields :category_queries
  end
end
