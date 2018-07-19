require Logger
user = Copan.Repo.one!(Copan.Schema.User, email: "copan@copan.com")

Enum.map(1..100000, fn (x) ->
  no_show = rem(x, 2) == 0
  status = if rem(x, 2) == 0, do: "created", else: "confirmed"

  random_date = FakerElixir.Date.backward(1..31)

  params = %{
    user_id: user.reference_id,
    status: status,
    no_show: no_show,
    reference_id: Ecto.UUID.generate,
    starts_at: random_date,
  }

  Copan.Commands.Appointment.Create.call(params)
end)
