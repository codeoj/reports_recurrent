defmodule ReportsRecurrent.Partners.Create do
  alias ReportsRecurrent.{Partner, Repo}

  def call(params) do
    params
    |> Partner.changeset()
    |> Repo.insert()
  end
end
