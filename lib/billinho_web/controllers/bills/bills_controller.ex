defmodule BillinhoWeb.BillsController do
  use BillinhoWeb, :controller

  alias Billinho.Bills
  alias Billinho.Bill

  action_fallback BillinhoWeb.FallbackController

  def index(conn, _params) do
    bills = Bills.list_bills()
    render(conn, "index.json", bills: bills)
  end

  def show(conn, %{"id" => id}) do
    bill = Bills.get_bill!(id)
    render(conn, "show.json", bill: bill)
  end

  def create(conn, %{"bills" => bill_params}) do
    case Bills.create_bill(bill_params) do
      {:ok, bill} ->
        conn
        |> put_status(:created)
        |> put_resp_header(
          "location",
          ~p"/api/bills/#{bill.id}"
        )
        |> render("show.json", bill: bill)

      error ->
        error
    end
  end

  def update(conn, %{"id" => id, "bills" => bill_params}) do
    bill = Bills.get_bill!(id)

    case Bills.update_bill(
           bill,
           bill_params
         ) do
      {:ok, %Bill{} = bill} ->
        conn
        |> put_status(:ok)
        |> put_resp_header(
          "location",
          ~p"/api/bills/#{bill.id}"
        )
        |> render(:show, bill: bill)

      error ->
        error
    end
  end

  def delete(conn, %{"id" => id}) do
    bill = Bills.get_bill!(id)

    case Bills.delete_bill(bill) do
      {:ok, %Bill{}} ->
        send_resp(conn, :no_content, "")

      error ->
        error
    end
  end
end
