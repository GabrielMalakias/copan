Copan.Repo.all(Copan.Schema.User)
|> Enum.map(fn(user) -> Copan.Commands.User.Destroy.call(user) end)


Copan.Commands.User.Create.call(%{name: "Gabriel", email: "gabriel07malakias@gmail.com"})


user = Copan.Repo.one!(Copan.Schema.User, email: "gabriel07malakias@gmail.com")

category = Copan.Commands.Category.Create.call(user, %{name: "Auto", position: 2})

image = "https://s.aolcdn.com/commerce/autodata/images/CAC70AUC171A021001.jpg"
title = "Das neue Auto"
description = "Das neue Auto"
content = "Das neue Auto"

Copan.Commands.Article.Create.call(user, category, %{title: title,
  description: description,
  content: content,
  image: image})
