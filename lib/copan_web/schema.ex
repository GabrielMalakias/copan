defmodule CopanWeb.Schema do
  use Absinthe.Schema

  import_types CopanWeb.Schema.User
  import_types CopanWeb.Schema.Article
  import_types CopanWeb.Schema.Category
  import_types CopanWeb.Schema.Appointment
  import_types CopanWeb.Schema.Filter

  query do
    import_fields :user_queries
    import_fields :article_queries
    import_fields :category_queries
    import_fields :appointment_queries
  end
end
