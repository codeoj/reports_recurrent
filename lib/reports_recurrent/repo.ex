defmodule ReportsRecurrent.Repo do
  use Ecto.Repo,
    otp_app: :reports_recurrent,
    adapter: Ecto.Adapters.Postgres
end
