defmodule ReportsRecurrent.Registration do
  use Ecto.Schema
  import Ecto.Changeset

  alias ReportsRecurrent.Partner

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:name, :cpf, :email]
  @required_with_partner_id [:name, :cpf, :email, :partner_id]

  schema "registration" do
    field :name, :string
    field :cpf, :string
    field :email, :string
    belongs_to(:partner, Partner)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_with_partner_id)
    |> validate_required(@required_params)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:cpf])
    |> unique_constraint([:email])
  end
end
