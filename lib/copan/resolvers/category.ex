defmodule Copan.Resolvers.Category do
  def all_categories(_root, %{user_id: id}, _info) do

    categories = Copan.Queries.Category.all(id)

    {:ok, categories}
  end
end
