defmodule Copan.Queries.User do
  @moduledoc """
  Defines some user queries
  """

  import Ecto.Query, only: [from: 2]

  def all do
    query = from u in Copan.Schema.User,
      select: %{id: u.id, email: u.email, name: u.name}

    Copan.Repo.all(query)
  end

  def find_by_id(id) do
    Copan.Repo.get(Copan.Schema.User, id)
  end

  def find_by_reference_id!(id) do
    query = from u in Copan.Schema.User,
      where: u.reference_id == type(^id, :string),
      select: u.id

    Copan.Repo.one!(query)
  end

  def tenant_exists?(%Copan.Schema.User{id: id})  do
    if Triplex.exists?(id) do
      {:ok, id}
    else
      {:error, 'Not Found'}
    end
  end
end
