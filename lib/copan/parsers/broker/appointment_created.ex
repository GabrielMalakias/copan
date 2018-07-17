defmodule Copan.Parsers.Broker.AppointmentCreated do
  def call({:ok, %{"appointment" => %{"merchant_key_account_uuid" => user_id, "uuid" => id}}}) do
    %{
      status: "created",
      no_show: false,
      user_id: user_id,
      reference_id: id
    }
  end
end
