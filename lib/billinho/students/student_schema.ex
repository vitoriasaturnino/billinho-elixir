defmodule Billinho.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :name, :string
    field :cpf, :string
    field :birth_date, :date
    field :phone_number, :string
    field :genre, :string
    field :payment_method, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(students, attrs) do
    students
    |> cast(attrs, [:name, :cpf, :birth_date, :phone_number, :genre, :payment_method])
    |> validate_required([:name, :cpf, :birth_date, :phone_number, :genre, :payment_method])
  end
end
