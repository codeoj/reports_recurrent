defmodule ReportsRecurrent.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ReportsRecurrent.Repo,
      # Start the Telemetry supervisor
      ReportsRecurrentWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ReportsRecurrent.PubSub},
      # Start the Endpoint (http/https)
      ReportsRecurrentWeb.Endpoint
      # Start a worker by calling: ReportsRecurrent.Worker.start_link(arg)
      # {ReportsRecurrent.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ReportsRecurrent.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ReportsRecurrentWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
