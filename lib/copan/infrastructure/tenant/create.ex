defmodule Copan.Infractructure.Tenant.Create do
  def call(%Copan.Schemas.User{id: id} = user) do
    Triplex.create(id)
  end
end
