defmodule Copan.Commands.User.Create do
  @moduledoc """
  Creates users given a map
  """

  import Ecto.Changeset

  def call(params) do
    params
    |> build_changeset
    |> Copan.Repo.insert!
    |> Copan.Infrastructure.Tenant.Create.call
  end

  defp build_changeset(params) do
    %Copan.Schema.User{}
    |> cast(params, [:name, :email])
    |> validate_required([:email, :name])
    |> unique_constraint(:email)
  end
end
