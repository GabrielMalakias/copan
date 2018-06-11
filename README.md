# Copan

![alt text](https://i.pinimg.com/originals/35/44/91/354491986514c997a3fd46f217084d5b.jpg)


### Some examples
Creating and deleting users

```elixir
Copan.Commands.User.Create.call(%{name: "Gabriel", email: "gabriel07malakias.com.br"})

Copan.Repo.all(Copan.Schema.User)
|> Enum.map(fn(user) -> Copan.Commands.User.Destroy.call(user)  end)
```


Render categories by tenant
```json
{allCategories(userId: "d6b1156d-5b74-4a1d-b69d-0219c7b6eb75") {
  id
  name
  position
}}
```
