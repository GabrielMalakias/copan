# Copan

![alt text](https://c1.staticflickr.com/3/2761/4365361350_21e9f71ca7_b.jpg)


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
