defmodule Copan.Infrastructure.Tenant.Create do
  @moduledoc """
  Creates tenants based on users
  """

  def call(%Copan.Schema.User{id: id}) do
    Triplex.create(id)
  end
end
