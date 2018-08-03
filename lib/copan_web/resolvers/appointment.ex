defmodule Copan.Resolvers.Appointment do
  require IEx
  require Logger

  def report(_root, %{filter: filter_params}, %{context: %{user: uuid}}) do
    find_user(uuid)
    |> evaluate_report(filter_params)
   end

  def graph(_root, %{filter: filter_params, group_by: grouped_by}, %{context: %{user: uuid}}) do
    find_user(uuid)
    |> evaluate_graph(filter_params, grouped_by)
  end

  def graph_n_lines(_root, %{filter: filter_params, group_by: grouped_by}, %{context: %{user: uuid}}) do
    find_user(uuid)
    |> evaluate_graph_n_lines(filter_params, grouped_by)
  end

  defp evaluate_report(user_id, filter_params) do
    {:ok, Copan.Queries.Appointment.report(user_id, filter_params)}
  end

  defp evaluate_graph(user_id, filter_params, grouped_by) do
    {:ok, Copan.Queries.Appointment.graph(user_id, filter_params, grouped_by)}
  end

  defp evaluate_graph_n_lines(user_id, filter_params, grouped_by) do
    graph = %{
      name: "Graph N lines",
      type: :graph,
      data: Copan.Queries.Appointment.graph_n_lines(user_id, filter_params, grouped_by),
      columns: ["total", "confirmed"]
    }

    {:ok, graph}
  end

  defp find_user(user_id) do
    Copan.Queries.User.find_by_reference_id!(user_id)
  end
end
