defmodule Copan.Infrastructure.AMPQSupervisor do
  @moduledoc """
  RabbitMQ Supervisor
  """

  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, :ok, [])
  end

  def init(:ok) do
    children = [
#      worker(Copan.Consumers.UserCreated, []),
#      worker(Copan.Consumers.AppointmentCreated, [])
    ]

    opts = [strategy: :one_for_one, name: __MODULE__ ]

    supervise(children, opts)
  end
end
