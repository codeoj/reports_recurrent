defmodule ReportsRecurrentWeb.PartnersController do
  use ReportsRecurrentWeb, :controller
  alias ReportsRecurrent.Partners.Create

  def create(conn, params) do
    {:ok, partner} = Create.call(params)
    conn
    |> put_status(:created)
    |> render("create.json", partner: partner)
  end
end
