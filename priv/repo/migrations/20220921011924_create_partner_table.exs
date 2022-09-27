defmodule ReportsRecurrent.Repo.Migrations.CreatePartnerTable do
  use Ecto.Migration

  def change do
    create table(:partner) do
      add :name, :string
    end

    create unique_index(:partner, [:name])
  end
end
