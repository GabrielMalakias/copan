user = Copan.Repo.one!(Copan.Schema.User, email: "copan@copan.com")

Enum.map(1..300, fn (x) ->
  no_show = rem(x, 2) == 0
  status = if rem(x, 2) == 0, do: "created", else: "confirmed"

  params = %{
    user_id: user.reference_id,
    status: status,
    no_show: no_show,
    reference_id: Ecto.UUID.generate,
  }

  Copan.Commands.Appointment.Create.call(params)
end)
