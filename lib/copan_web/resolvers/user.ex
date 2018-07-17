defmodule Copan.Resolvers.User do
  def all(_root, _args, _info) do
    users = Copan.Queries.User.all

    {:ok, users}
  end
end
