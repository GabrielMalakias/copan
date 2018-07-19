defmodule Copan.Consumers.UserCreated do
  @behaviour GenRMQ.Consumer

  require IEx
  require Logger

  def start_link() do
    GenRMQ.Consumer.start_link(__MODULE__, name: __MODULE__)
  end

  def init() do
    [
      queue: "copan_user_created",
      exchange: "public",
      routing_key: "users.v2.created",
      uri: "amqp://guest:guest@rabbitmq:5672",
      prefetch_count: "10",
      retry_delay_function: fn attempt -> :timer.sleep(2000 * attempt) end
    ]
  end

  def ack(%GenRMQ.Message{attributes: %{delivery_tag: tag}} = message) do
    Logger.debug("Message successfully processed. Tag: #{tag}")
    GenRMQ.Consumer.ack(message)
  end

  def reject(%GenRMQ.Message{attributes: %{delivery_tag: tag}} = message, requeue \\ true) do
    Logger.info("Rejecting message, tag: #{tag}, requeue: #{requeue}")
    GenRMQ.Consumer.reject(message, requeue)
  end

  def consumer_tag() do
    "user_created"
  end

  def execute(%GenRMQ.Message{payload: payload}) do
    payload
    |> Poison.decode
    |> Copan.Parsers.Broker.UserCreated.call
    |> Copan.Commands.User.Create.call
  end

  def handle_message(message) do
    try do
      execute(message)
      ack(message)
    rescue
      exception ->
        Logger.error(Exception.format(:error, exception, System.stacktrace()))
        reject(message, false)
    end
  end
end
