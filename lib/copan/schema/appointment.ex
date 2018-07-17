defmodule Copan.Schema.Appointment do
  @moduledoc """
  Appointments
  """
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "appointments" do
    field(:status, :string)
    field(:no_show, :boolean)

    field(:reference_id, :string)

    timestamps()
  end
end
