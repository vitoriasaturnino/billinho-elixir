defmodule BillinhoWeb.StudentsController do
  use BillinhoWeb, :controller

  alias Billinho.Students
  alias Billinho.Student

  action_fallback BillinhoWeb.FallbackController

  def index(conn, _params) do
    students = Students.list_students()
    render(conn, "index.json", students: students)
  end

  def show(conn, %{"id" => id}) do
    student = Students.get_student!(id)
    render(conn, "show.json", students: student)
  end

  def create(conn, %{"students" => student_params}) do
    student_params = format_dates(student_params)

    case Students.create_student(student_params) do
      {:ok, student} ->
        conn
        |> put_status(:created)
        |> put_resp_header(
          "location",
          ~p"/api/students/#{student.id}"
        )
        |> render("show.json", students: student)

      error ->
        error
    end
  end

  def update(conn, %{"id" => id, "students" => student_params}) do
    student = Students.get_student!(id)

    case Students.update_student(
           student,
           student_params
         ) do
      {:ok, %Student{} = student} ->
        conn
        |> put_status(:ok)
        |> put_resp_header(
          "location",
          ~p"/api/students/#{student.id}"
        )
        |> render(:show, students: student)

      error ->
        error
    end
  end

  def delete(conn, %{"id" => id}) do
    student = Students.get_student!(id)

    case Students.delete_student(student) do
      {:ok, %Student{}} ->
        send_resp(conn, :no_content, "")

      error ->
        error
    end
  end

  defp format_dates(%{"birth_date" => birth_date} = student_params) do
    Map.put(student_params, "birth_date", Date.from_iso8601!(birth_date))
  end
end
