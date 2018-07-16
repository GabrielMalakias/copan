defmodule CopanWeb.Router do
  use CopanWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug CopanWeb.Plugs.Context
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: CopanWeb.Schema,
      interface: :simple,
      context: %{pubsub: CopanWeb.Endpoint}

    forward "/", Absinthe.Plug,
      schema: CopanWeb.Schema
  end
end
