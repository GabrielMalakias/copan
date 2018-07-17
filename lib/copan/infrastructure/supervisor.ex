defmodule Copan.Infrastructure.AMPQSupervisor do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, :ok, [])
  end

  def init(:ok) do
    children = [
      worker(Copan.Consumers.UserCreated, [])
    ]

    opts = [strategy: :one_for_one, name: __MODULE__ ]

    supervise(children, opts)
  end
end
