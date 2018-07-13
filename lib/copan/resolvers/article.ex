require IEx
defmodule Copan.Resolvers.Article do
  def all(_root, %{scope: %{user_id: id}}, _info) do
    articles = Copan.Queries.Article.all(id)

    {:ok, articles}
  end
end
