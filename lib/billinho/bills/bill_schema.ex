defmodule Billinho.Bill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bills" do
    field :amount, :float
    field :due_date, :date
    field :status, Ecto.Enum, values: [:open, :pending, :late]

    belongs_to :enrollment, Billinho.Enrollment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(bill, attrs) do
    bill
    |> cast(attrs, [:amount, :due_date, :status, :enrollment_id])
    |> validate_required([:amount, :due_date, :status, :enrollment_id])
  end
end
