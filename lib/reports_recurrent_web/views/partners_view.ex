defmodule ReportsRecurrentWeb.PartnersView do
  use ReportsRecurrentWeb, :view

  alias ReportsRecurrent.Partner

  def render("create.json", %{partner: %Partner{} = partner}) do
    %{
      message: "Partner created!",
      partner: %{
        id: partner.id,
        name: partner.name
      }
    }
  end
end
