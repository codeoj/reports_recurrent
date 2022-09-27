defmodule ReportsRecurrentWeb.ReportsController do
  use ReportsRecurrentWeb, :controller
  alias ReportsRecurrent.Reports.StreamReport

  def create(conn, params) do
    StreamReport.csv(params)
    conn
    |> put_status(:ok)
    |> text("Created")
  end
end
