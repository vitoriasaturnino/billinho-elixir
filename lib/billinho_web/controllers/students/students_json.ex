defmodule BillinhoWeb.StudentsJSON do
  alias Billinho.Student

  @doc """
  Renders a list of students.
  """
  def index(%{students: students}) do
    %{data: for(student <- students, do: data(student))}
  end

  @doc """
  Renders a single student.
  """
  def show(%{students: students}) do
    %{data: data(students)}
  end

  defp data(%Student{} = students) do
    %{
      id: students.id,
      name: students.name,
      cpf: students.cpf,
      birth_date: students.birth_date,
      phone_number: students.phone_number,
      genre: students.genre,
      payment_method: students.payment_method
    }
  end
end
