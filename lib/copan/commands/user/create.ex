defmodule Copan.Commands.User.Create do
  import Ecto.Changeset

  def call(params) do
    build_changeset(params)
    |> Copan.Repo.insert!
    |> Copan.Infrastructure.Tenant.Create.call
  end

  defp build_changeset(params) do
    %Copan.Schemas.User{}
    |> cast(params, [:name, :email])
    |> validate_required([:email, :name])
    |> unique_constraint(:email)
  end
end
