defmodule Billinho.Enrollments do
  import Ecto.Query, warn: false

  alias Billinho.{Enrollment, Repo, Bills}

  def list_enrollments do
    Repo.all(Enrollment)
  end

  def get_enrollment!(id) do
    Repo.get!(Enrollment, id)
  end

  def create(attrs \\ %{}) do
    with {:ok, enrollment} <- create_enrollment(attrs),
      _bills  <- create_bill(enrollment) do
      {:ok, enrollment}
    end
  end

  def update_enrollment(%Enrollment{} = enrollment, attrs) do
    enrollment
    |> Enrollment.changeset(attrs)
    |> Repo.update()
  end

  def delete_enrollment(%Enrollment{} = enrollment) do
    Repo.delete(enrollment)
  end

  defp create_enrollment(enrollment_params) do
    %Enrollment{}
    |> Enrollment.changeset(enrollment_params)
    |> Repo.insert()
  end

  defp create_bill(enrollment) do
    for _ <- 1..enrollment.installments do
      bill_params = build_bill_params(enrollment)
      Bills.create_bill(bill_params)
    end
  end

    defp build_bill_params(enrollment) do
      %{
        amount: enrollment.amount / enrollment.installments,
        due_date: Date.utc_today() |> Date.add(enrollment.due_day),
        status: :open,
        enrollment_id: enrollment.id
      }
    end
end
