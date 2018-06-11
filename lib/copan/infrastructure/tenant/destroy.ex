defmodule Copan.Infrastructure.Tenant.Destroy do
  @moduledoc """
  Destroy tenants based on id
  """

  def call(%Copan.Schema.User{id: id}) do
    Triplex.drop(id)
  end
end
