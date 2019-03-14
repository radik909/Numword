defmodule Numword.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Numword.Dictionary
    ]

    opts = [strategy: :one_for_one, name: Numword.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
