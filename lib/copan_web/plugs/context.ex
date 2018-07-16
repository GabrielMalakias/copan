defmodule CopanWeb.Plugs.Context do
  @behaviour Plug

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    token = get_token_from_header(conn)

    add_to_context(token, conn)
  end

  def add_to_context(user, conn) do
    Absinthe.Plug.put_options(conn, context: %{user: user})
  end

  """
  def add_to_context(nil, conn) do
    Logger.info("Adding to FORBIDDEN")
    conn
    |> put_status(:forbidden)
    |> halt
  end
  """

  def get_token_from_header(conn) do
    ["Bearer " <> token] = get_req_header(conn, "authorization")
    token
  end
end
