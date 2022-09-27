defmodule ReportsRecurrent.Registrations.Create do
  alias ReportsRecurrent.{Registration, Repo}

  def call(params) do
    params
    |> Registration.changeset()
    |> Repo.insert()
  end
end
