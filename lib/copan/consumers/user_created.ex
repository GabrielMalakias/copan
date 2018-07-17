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
      routing_key: "#",
      uri: "amqp://guest:guest@localhost:5672",
      prefetch_count: "10",
      retry_delay_function: fn attempt -> :timer.sleep(2000 * attempt) end
    ]
  end

  def consumer_tag() do
    "user_created"
  end

  def handle_message(message) do
    rescue exception ->
    Logger.error(Exception.format(:error, exception, System.stacktrace()))
  end
end

