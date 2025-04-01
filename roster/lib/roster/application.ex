defmodule Roster.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RosterWeb.Telemetry,
      Roster.Repo,
      {DNSCluster, query: Application.get_env(:roster, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Roster.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Roster.Finch},
      # Start a worker by calling: Roster.Worker.start_link(arg)
      # {Roster.Worker, arg},
      # Start to serve requests, typically the last entry
      RosterWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Roster.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RosterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
