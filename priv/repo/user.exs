require Logger
require Ecto

Enum.map(1..30000, fn (x) ->
  Copan.Commands.User.Create.call(%{
    name: FakerElixir.Name.name(),
    email: FakerElixir.Internet.email(),
    reference_id: Ecto.UUID.generate()})
end)
