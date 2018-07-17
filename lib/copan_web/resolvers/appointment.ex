defmodule Copan.Resolvers.Appointment do
  require IEx
  require Logger
  def report(_root, _params, %{context: %{user: uuid}}) do
    find_user(uuid)
    |> evaluate_report
   end

  defp evaluate_report(user_id) do
    {:ok, Copan.Queries.Appointment.report(user_id)}
  end

  defp find_user(user_id) do
    Copan.Queries.User.find_by_reference_id!(user_id)
  end
end
