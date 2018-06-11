# Copan

![alt text](https://c1.staticflickr.com/3/2761/4365361350_21e9f71ca7_b.jpg)


Copan.Commands.User.Create.call(%{name: "Gabriel", email: "gabriel07malakias.com.br"})
Copan.Repo.all(Copan.Schema.User) |> Enum.map(fn(user) -> Copan.Commands.User.Destroy.call(user)  end)


https://www.howtographql.com/graphql-elixir/0-introduction/
