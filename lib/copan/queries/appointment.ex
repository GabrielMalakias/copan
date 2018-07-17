defmodule Copan.Queries.Appointment do
  @moduledoc """
  Defines some appointment queries
  """

  require Logger

  import Ecto.Query, only: [from: 2]

  def report(id) do
    %{
      total: total_count(id),
      no_show: no_show_count(id),
      created: confirmed_count(id)
    }
  end

  defp total_count(id) do
    Copan.Repo.aggregate(Copan.Schema.Appointment, :count, :id, prefix: id)
  end

  defp no_show_count(id) do
    query = from a in Copan.Schema.Appointment,
      where: a.no_show == false

    Copan.Repo.aggregate(query, :count, :no_show, prefix: id)
  end

  defp confirmed_count(id) do
    query = from a in Copan.Schema.Appointment,
      where: a.status == "created"

    Copan.Repo.aggregate(query, :count, :status, prefix: id)
  end
end
