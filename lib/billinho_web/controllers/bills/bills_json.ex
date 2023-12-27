defmodule BillinhoWeb.BillsJSON do
  alias Billinho.Bill

  @doc """
  Renders a list of bills.
  """
  def index(%{bills: bills}) do
    %{data: for(bill <- bills, do: data(bill))}
  end

  @doc """
  Renders a single bill.
  """
  def show(%{bills: bills}) do
    %{data: data(bills)}
  end

  defp data(%Bill{} = bills) do
    %{
      id: bills.id,
      amount: bills.amount,
      due_date: bills.due_date,
      status: bills.status,
      enrollment_id: bills.enrollment_id
    }
  end
end
