defmodule Copan.Parsers.Broker.UserCreated do
  def call({:ok, %{"data" => %{"attributes" => attributes, "id" => id}}}) do
    %{
      name: attributes["name"],
      email: attributes["email"],
      reference_id: id
    }
  end
end
