defmodule Copan.Repo.Migrations.AddAppointmentsTable do
  use Ecto.Migration

  def up do
    create table("appointments") do
      add :status, :string
      add :no_show, :boolean
      add :price, :float
      add :reference_id, :string
      add :starts_at, :utc_datetime

      timestamps()
    end

    create index("appointments", [:status])
    create index("appointments", [:reference_id])
  end

  def down do
    drop table("appointments")
  end
end
