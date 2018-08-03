defmodule Copan.Repo.Migrations.AddGistIndexStartsAtToAppointment do
  use Ecto.Migration

  def up do
    create index("appointments", [:starts_at], name: "appointments_starts_at_g",  concurrently: false, using: :gist)
  end

  def down do
    drop index("appointments", [:starts_at], name: "appointments_starts_at_g")
  end
end
