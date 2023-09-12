defmodule Myphoenix.Repo do
  use Ecto.Repo,
    otp_app: :myphoenix,
    adapter: Ecto.Adapters.Postgres
end
