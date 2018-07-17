defmodule Copan.Schema.User do
  @moduledoc """
  Basically the tenants list
  """

  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field(:name, :string)
    field(:email, :string)
    field(:reference_id, :string)

    timestamps()
  end
end
