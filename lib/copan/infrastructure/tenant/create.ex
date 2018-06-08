defmodule Copan.Infractructure.Tenant.Create do
  def call(%Copan.Schema.User{id: id} = user) do
    Triplex.create(id)
  end
end
