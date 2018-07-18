defmodule Copan.Resolvers.Appointment do
  require IEx
  require Logger

  def report(_root, %{filter: filter_params}, %{context: %{user: uuid}}) do
    find_user(uuid)
    |> evaluate_report(filter_params)
   end

  defp evaluate_report(user_id, filter_params) do
    {:ok, Copan.Queries.Appointment.report(user_id, filter_params)}
  end

  defp find_user(user_id) do
    Copan.Queries.User.find_by_reference_id!(user_id)
  end
end
