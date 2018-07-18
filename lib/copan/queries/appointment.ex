defmodule Copan.Queries.Appointment do
  @moduledoc """
  Defines some appointment queries
  """
  require Logger

  import Ecto.Query, only: [from: 2]

  @spec report(String.t(), tuple()) :: tuple()
  def report(id, filter_params) do
    %{
      total: total_count(id, filter_params),
      no_show: no_show_count(id, filter_params),
      created: confirmed_count(id, filter_params)
    }
  end

  @spec total_count(String.t(), tuple()) :: non_neg_integer()
  defp total_count(id, %{starts_at: starts_at, ends_at: ends_at}) do
    query = from a in Copan.Schema.Appointment,
      where: a.inserted_at >= type(^starts_at, :utc_datetime),
      where: a.inserted_at <= type(^ends_at, :utc_datetime)

    Copan.Repo.aggregate(query, :count, :id, prefix: id)
  end

  @spec no_show_count(String.t(), tuple()) :: non_neg_integer()
  defp no_show_count(id, %{starts_at: starts_at, ends_at: ends_at}) do
    query = from a in Copan.Schema.Appointment,
      where: a.no_show == false,
      where: a.inserted_at >= type(^starts_at, :utc_datetime),
      where: a.inserted_at <= type(^ends_at, :utc_datetime)


    Copan.Repo.aggregate(query, :count, :no_show, prefix: id)
  end

  @spec confirmed_count(String.t(), tuple()) :: non_neg_integer()
  defp confirmed_count(id, %{starts_at: starts_at, ends_at: ends_at}) do
    query = from a in Copan.Schema.Appointment,
      where: a.status == "created",
      where: a.inserted_at >= type(^starts_at, :utc_datetime),
      where: a.inserted_at <= type(^ends_at, :utc_datetime)


    Copan.Repo.aggregate(query, :count, :status, prefix: id)
  end
end
