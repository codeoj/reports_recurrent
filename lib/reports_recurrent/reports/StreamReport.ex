defmodule ReportsRecurrent.Reports.StreamReport do
  import Ecto.Query
  alias ReportsRecurrent.{Registration, Repo}

  def csv(report_name) do
    date_today = Date.utc_today()
    #date_today = ~D[2022-09-26]

    query = case report_name do
      %{"report_name" => "DailyRegistrations"} ->
        from registration in Registration,
          where: fragment("?::date", registration.inserted_at) == ^date_today

      %{"report_name" => "DailyRegistrationsByPartner"} ->
        from registration in Registration,
        order_by: registration.partner_id,
        where: fragment("?::date", registration.inserted_at) == ^date_today
    end

    {:ok, registration_list} =
      Repo.transaction(fn ->
        query
        |> Repo.stream()
        |> Enum.map(&parse_line/1)
      end)

    File.write("reports.csv", registration_list)
    IO.inspect(registration_list)
  end

  def parse_line(%Registration{id: id, partner_id: partner_id, name: name, cpf: cpf, email: email}) do
    "\n#{id}, #{partner_id}, #{name}, #{cpf}, #{email}"
  end
end
