defmodule Copan.Resolvers.Article do
  def all(_root, _params, %{context: %{user: uuid}}) do
    find_user(uuid)
    |> tenant_exists?
    |> find_articles
   end

  defp find_user(user_id) do
    Copan.Queries.User.find_by_id(user_id)
  end

  defp tenant_exists?(%Copan.Schema.User{} = user) do
    Copan.Queries.User.tenant_exists?(user)
  end

  defp tenant_exists?(nil) do
    {:error, "User not found"}
  end

  defp find_articles({:ok, id}) do
    {:ok, Copan.Queries.Article.all(id)}
  end

  defp find_articles(error) do
    error
  end
end
