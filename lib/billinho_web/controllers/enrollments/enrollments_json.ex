defmodule BillinhoWeb.EnrollmentsJSON do
  alias Billinho.Enrollment

  @doc """
  Renders a list of enrollments.
  """
  def index(%{enrollments: enrollments}) do
    %{data: for(enrollment <- enrollments, do: data(enrollment))}
  end

  @doc """
  Renders a single enrollment.
  """
  def show(%{enrollments: enrollments}) do
    %{data: data(enrollments)}
  end

  defp data(%Enrollment{} = enrollments) do
    %{
      id: enrollments.id,
      amount: enrollments.amount,
      installments: enrollments.installments,
      due_day: enrollments.due_day,
      course_name: enrollments.course_name,
      educational_institution_id: enrollments.educational_institution_id,
      student_id: enrollments.student_id
    }
  end
end
