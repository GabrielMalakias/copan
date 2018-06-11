defmodule CopanWeb.Router do
  use CopanWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: CopanWeb.Schema,
      interface: :simple,
      context: %{pubsub: CopanWeb.Endpoint}
  end
end
