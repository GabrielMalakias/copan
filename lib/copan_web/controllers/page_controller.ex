defmodule CopanWeb.PageController do
  use CopanWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
