defmodule ReportsRecurrentWeb.RegistrationsController do
  use ReportsRecurrentWeb, :controller
  alias ReportsRecurrent.Registrations.Create

  def create(conn, params) do
    {:ok, registration} = Create.call(params)
    conn
    |> put_status(:created)
    |> render("create.json", registration: registration)
  end
end
