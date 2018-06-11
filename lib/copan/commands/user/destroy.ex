defmodule Copan.Commands.User.Destroy do
  @moduledoc """
  Destroy user given a email
  """

  import Ecto.Changeset

  def call(%Copan.Schema.User{email: email} = user) do
    user
    |> Copan.Repo.delete!
    |> Copan.Infrastructure.Tenant.Destroy.call
  end
end
