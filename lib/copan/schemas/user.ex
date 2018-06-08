defmodule Copan.Schemas.User do
  @moduledoc """
  Basically the tenants list
  """

  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field(:name, :string)
    field(:email, :string)

    timestamps()
  end
end
