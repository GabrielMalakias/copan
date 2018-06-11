defmodule Copan.Commands.Category.Create do
  @moduledoc """
  Creates categories given a map
  """

  import Ecto.Changeset

  def call(%Copan.Schema.User{id: id}, params) do
    params
    |> build_changeset
    |> Copan.Repo.insert!(prefix: id)
  end

  defp build_changeset(params) do
    %Copan.Schema.Category{}
    |> cast(params, [:name, :position])
    |> validate_required([:name])
  end
end
