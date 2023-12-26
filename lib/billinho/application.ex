defmodule Billinho.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BillinhoWeb.Telemetry,
      Billinho.Repo,
      {DNSCluster, query: Application.get_env(:billinho, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Billinho.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Billinho.Finch},
      # Start a worker by calling: Billinho.Worker.start_link(arg)
      # {Billinho.Worker, arg},
      # Start to serve requests, typically the last entry
      BillinhoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Billinho.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BillinhoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
