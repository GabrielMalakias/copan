defmodule Copan.Commands.Appointment.Create do
  @moduledoc """
  Creates articles given a map
  """

  import Ecto.Changeset

  require IEx

  def call(params) do
    id = find_user!(params.user_id)

    params
    |> build_changeset
    |> Copan.Repo.insert!(prefix: id)
  end

  def find_user!(user_id) do
    Copan.Queries.User.find_by_reference_id!(user_id)
  end

  defp build_changeset(params) do
    %Copan.Schema.Appointment{}
    |> cast(params, [:status, :no_show, :reference_id])
    |> validate_required([:status, :no_show, :reference_id])
  end
end
