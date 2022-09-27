defmodule ReportsRecurrentWeb.RegistrationsView do
  use ReportsRecurrentWeb, :view

  alias ReportsRecurrent.Registration

  def render("create.json", %{registration: %Registration{} = registration}) do
    %{
      message: "Registration created!",
      registration: %{
        id: registration.id,
        name: registration.name,
        cpf: registration.cpf,
        partner_id: registration.partner_id,
        inserted_at: registration.inserted_at
      }
    }
  end
end
