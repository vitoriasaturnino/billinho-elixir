defmodule Billinho.EducationalInstitution do
  use Ecto.Schema
  import Ecto.Changeset

  schema "educational_institutions" do
    field :name, :string
    field :cnpj, :string
    field :type, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(educational_institutions, attrs) do
    educational_institutions
    |> cast(attrs, [:cnpj, :name, :type])
    |> validate_required([:cnpj, :name, :type])
  end
end
