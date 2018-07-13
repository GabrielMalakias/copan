defmodule CopanWeb.Plugs.Context do
  @behavior Plug

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    get_token_from_header
    |> add_to_context(conn)
  end

  def add_to_context(nil, conn) do
    conn
    |> send_resp(403)
    |> halt
  end

  def add_to_context(user, _conn) do
    Absinthe.Plug.put_options(conn, context: %{user: user})
  end

  def get_token_from_header do
    ["Bearer " <> token] = get_req_header(conn, "Authorization")
    token
  end
end
