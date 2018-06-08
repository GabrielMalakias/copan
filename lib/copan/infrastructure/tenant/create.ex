defmodule Copan.Infractructure.Tenant.Create do
  @moduledoc """
  Creates tenants based on users
  """

  def call(%Copan.Schema.User{id: id} = user) do
    Triplex.create(id)
  end
end
