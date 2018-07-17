defmodule Copan.Application do
  @moduledoc """
  Application definitions
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Copan.Repo, []),
      supervisor(CopanWeb.Endpoint, []),
      supervisor(Copan.Infrastructure.AMPQSupervisor, []),
    ]

    opts = [strategy: :one_for_one, name: Copan.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    CopanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
