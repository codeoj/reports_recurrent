defmodule ReportsRecurrent.Partner do
  use Ecto.Schema
  import Ecto.Changeset

  alias ReportsRecurrent.Registration

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name]

  schema "partner" do
    field :name, :string

    has_many(:registration, Registration)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
