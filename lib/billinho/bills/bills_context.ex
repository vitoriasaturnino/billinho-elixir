defmodule Billinho.Bills do
  import Ecto.Query, warn: false

  alias Billinho.Bill
  alias Billinho.Repo

  def list_bills do
    Repo.all(Bill)
  end

  def get_bill!(id) do
    Repo.get!(Bill, id)
  end

  def create_bill(attrs \\ %{}) do
    %Bill{}
    |> Bill.changeset(attrs)
    |> Repo.insert()
  end

  def update_bill(%Bill{} = bill, attrs) do
    bill
    |> Bill.changeset(attrs)
    |> Repo.update()
  end

  def delete_bill(%Bill{} = bill) do
    Repo.delete(bill)
  end
end
