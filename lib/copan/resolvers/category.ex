defmodule Copan.Resolvers.Category do
  require IEx
  """
  def all(_root, %{scope: %{user_id: id}}, _info) do
    Copan.Validators.Scope.validate(id)
    |> execute
  end
  """
  def all(_root, _params, _info) do
    IEx.pry
  end

  defp execute({:ok, id}) do
    find_user(id)
    |> tenant_exists?
    |> find_categories
  end

  defp execute(error) do
    error
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

  defp find_categories({:ok, id}) do
    {:ok, Copan.Queries.Category.all(id)}
  end

  defp find_categories(error) do
    error
  end
end
