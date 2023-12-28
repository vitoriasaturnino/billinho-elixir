defmodule Billinho.EducationalInstitution do
  use Ecto.Schema
  import Ecto.Changeset

  schema "educational_institutions" do
    field :name, :string
    field :cnpj, :string
    field :type, Ecto.Enum, values: [:nursery, :school, :university]

    has_many :enrollments, Billinho.Enrollment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(educational_institutions, attrs) do
    educational_institutions
    |> cast(attrs, [:cnpj, :name, :type])
    |> validate_required([:cnpj, :name, :type])
    |> validate_format(:cnpj, ~r/^\d{14}$/)
    |> unique_constraint([:name])
    |> unique_constraint([:cnpj])
  end
end
