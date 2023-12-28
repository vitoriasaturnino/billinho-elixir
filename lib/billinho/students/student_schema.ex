defmodule Billinho.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :name, :string
    field :cpf, :string
    field :birth_date, :date
    field :phone_number, :string
    field :genre, Ecto.Enum, values: [:F, :M, :O]
    field :payment_method, Ecto.Enum, values: [:ticket, :card]

    has_many :enrollments, Billinho.Enrollment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(students, attrs) do
    students
    |> cast(attrs, [:name, :cpf, :birth_date, :phone_number, :genre, :payment_method])
    |> validate_required([:name, :cpf, :birth_date, :phone_number, :genre, :payment_method])
    |> validate_format(:cpf, ~r/^\d{11}$/)
    |> unique_constraint([:cpf])
  end
end
