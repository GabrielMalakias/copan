defmodule CopanWeb.Schema.Filter do
  use Absinthe.Schema.Notation

  import_types Absinthe.Type.Custom

  input_object :filter do
    field :starts_at, non_null(:datetime)
    field :ends_at, non_null(:datetime)
  end
end
