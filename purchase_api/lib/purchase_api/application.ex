defmodule PurchaseApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PurchaseApiWeb.Telemetry,
      PurchaseApi.Repo,
      {DNSCluster, query: Application.get_env(:purchase_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PurchaseApi.PubSub},
      # Start a worker by calling: PurchaseApi.Worker.start_link(arg)
      # {PurchaseApi.Worker, arg},
      # Start to serve requests, typically the last entry
      PurchaseApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PurchaseApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PurchaseApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
