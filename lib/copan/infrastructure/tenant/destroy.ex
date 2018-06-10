defmodule Copan.Infrastructure.Tenant.Destroy do
  @moduledoc """
  Destroy tenants based on id
  """

  def call(id) do
    Triplex.drop(id)
  end
end
