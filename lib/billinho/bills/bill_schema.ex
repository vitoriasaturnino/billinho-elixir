defmodule Billinho.Bill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bills" do
    field :amount, :float
    field :due_date, :date
    field :status, :string

    belongs_to :enrollment, Billinho.Enrollment
  end

  @doc false
  def changeset(bill, attrs) do
    bill
    |> cast(attrs, [:amount, :due_date, :status])
    |> validate_required([:amount, :due_date, :status])
  end
end
