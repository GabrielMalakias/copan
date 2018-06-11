defmodule Copan.Queries.Article do
  @moduledoc """
  Defines some articles queries
  """

  import Ecto.Query, only: [from: 2]

  def all(id) do
    Copan.Repo.all(Copan.Schema.Article, prefix: id)
  end
end
