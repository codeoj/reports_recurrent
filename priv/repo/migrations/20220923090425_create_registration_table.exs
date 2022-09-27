defmodule ReportsRecurrent.Repo.Migrations.CreateRegistrationTable do
  use Ecto.Migration

  def change do
    create table(:registration) do
      add :partner_id, references(:partner, type: :binary_id)
      add :name, :string
      add :cpf, :string
      add :email, :string

      timestamps()
    end

    create unique_index(:registration, [:cpf])
    create unique_index(:registration, [:email])
  end
end
