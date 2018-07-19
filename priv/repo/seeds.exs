Copan.Repo.all(Copan.Schema.User)
|> Enum.map(fn(user) -> Copan.Commands.User.Destroy.call(user) end)


user_params = %{
  name: "Copan",
  email: "copan@copan.com",
  reference_id: "00000000-0000-4000-8000-000000000000"
}

Copan.Commands.User.Create.call(user_params)

user = Copan.Repo.one!(Copan.Schema.User, email: "copan@copan.com")

category = Copan.Commands.Category.Create.call(user, %{name: "Auto", position: 2})

image = "https://s.aolcdn.com/commerce/autodata/images/CAC70AUC171A021001.jpg"
title = "Das neue Auto"
description = "Das neue Auto"
content = "Das neue Auto"

article_params = %{
  title: title,
  description: description,
  content: content,
  image: image
}
Copan.Commands.Article.Create.call(user, category, article_params)


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
