# Copan
![alt text](https://i.pinimg.com/originals/35/44/91/354491986514c997a3fd46f217084d5b.jpg)

This is a Proof of concept project that applies some concepts and technologies like Elixir/Phoenix, Schema Multi-Tenancy and GraphQL

It has some dependencies:
- Phoenix: The web framework
- Ecto/Postgrex: A database wrapper and the elixir client to Postgres
- Triplex: The library used to manage schemas
- Absinthe: An GraphQL implementation for elixir
- GenRMQ: A behaviour based library that handle the RabbitMQ connection

### Instalation
Install Elixir
Run Migrations
##### Creating the database structure
```shell
mix ecto.create
mix ecto.migrate
```
#####Seeding the database
```shell
mix run priv/repo/seeds.exs
mix run priv/repo/appointment_seeds.exs
```

### GraphQL Interface
By running this project, the GraphQL endpoint will be available on `http://localhost:4000/api`

To use this interface, you have to add the User Reference id to the Authorization Header

```shell
Authorization: Bearer <user-reference-id>
```

##### Appointments Graph
```shell
{
  appointmentGraph(filter: {startsAt: "2018-07-10T22:00:00.000Z",
    endsAt: "2018-07-20T22:00:00.000Z"}, groupBy: HOUR) {
    date
    value
  }
}
```

##### Appointments Report
```shell
{
  appointmentReport(filter: {startsAt: "2018-07-10T22:00:00.000Z",
    endsAt: "2018-07-20T22:00:00.000Z"}) {
    total
    noShow
    created
    confirmed
  }
}
```
