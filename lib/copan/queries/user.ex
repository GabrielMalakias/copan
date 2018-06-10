defmodule Copan.Queries.User do
  @moduledoc """
  Defines some user queries
  """

  import Ecto.Query, only: [from: 2]

  def all do
    query = from u in Copan.Schema.User,
    select: %{id: u.id, email: u.email}

    Copan.Repo.all(query)
  end
end
