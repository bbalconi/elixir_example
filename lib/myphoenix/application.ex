defmodule Myphoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MyphoenixWeb.Telemetry,
      # Start the Ecto repository
      Myphoenix.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Myphoenix.PubSub},
      # Start Finch
      {Finch, name: Myphoenix.Finch},
      # Start the Endpoint (http/https)
      MyphoenixWeb.Endpoint
      # Start a worker by calling: Myphoenix.Worker.start_link(arg)
      # {Myphoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Myphoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MyphoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
