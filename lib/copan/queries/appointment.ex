defmodule Copan.Queries.Appointment do
  @moduledoc """
  Defines some appointment queries
  """
  require Logger
  require IEx

  import Ecto.Query, only: [from: 2]

  @spec report(String.t(), tuple()) :: tuple()
  def report(id, filter_params) do
    %{
      total: total_count(id, filter_params),
      no_show: no_show_count(id, filter_params),
      created: confirmed_count(id, filter_params)
    }
  end

  @spec graph(String.t(), tuple(), atom()) :: tuple()
  def graph(id, filter_params, grouped_by) do
    total_group_by(id, filter_params, grouped_by)
  end

  @spec total_group_by(String.t(), tuple(), atom()) :: tuple()
  def total_group_by(id, filter_params, :day) do
    query = from a in build_base_query(filter_params),
      group_by: fragment("date_trunc('day', ?)", a.inserted_at),
      select: %{ date: type(fragment("date_trunc('day', ?)", a.inserted_at), :utc_datetime), value: count(a.id) }

    Copan.Repo.all(query, prefix: id)
  end

  @spec total_group_by(String.t(), tuple(), atom()) :: tuple()
  def total_group_by(id, filter_params, :minute) do
    query = from a in build_base_query(filter_params),
      group_by: fragment("date_trunc('minute', ?)", a.inserted_at),
      select: %{ date: type(fragment("date_trunc('minute', ?)", a.inserted_at), :utc_datetime), value: count(a.id) }

    Copan.Repo.all(query, prefix: id)
  end

  @spec total_group_by(String.t(), tuple(), atom()) :: tuple()
  def total_group_by(id, filter_params, :hour) do
    query = from a in build_base_query(filter_params),
      group_by: fragment("date_trunc('hour', ?)", a.inserted_at),
      select: %{ date: type(fragment("date_trunc('hour', ?)", a.inserted_at), :utc_datetime), value: count(a.id) }

    Copan.Repo.all(query, prefix: id)
  end

  @spec total_count(String.t(), tuple()) :: non_neg_integer()
  defp total_count(id, filter_params) do
    filter_params
    |> build_base_query
    |> Copan.Repo.aggregate(:count, :id, prefix: id)
  end

  @spec no_show_count(String.t(), tuple()) :: non_neg_integer()
  defp no_show_count(id, filter_params) do
    filter_params
    |> build_base_query
    |> no_show
    |> Copan.Repo.aggregate(:count, :no_show, prefix: id)
  end

  @spec confirmed_count(String.t(), tuple()) :: non_neg_integer()
  defp confirmed_count(id, filter_params) do
    filter_params
    |> build_base_query
    |> confirmed
    |> Copan.Repo.aggregate(:count, :status, prefix: id)
  end

  defp no_show(query) do
    from a in query,
    where: a.status == "created"
  end

  defp confirmed(query) do
    from a in query,
    where: a.status == "created"
  end

  defp build_base_query(%{starts_at: starts_at, ends_at: ends_at}) do
    from a in Copan.Schema.Appointment,
      where: a.inserted_at >= type(^starts_at, :utc_datetime),
      where: a.inserted_at <= type(^ends_at, :utc_datetime)
  end
end
