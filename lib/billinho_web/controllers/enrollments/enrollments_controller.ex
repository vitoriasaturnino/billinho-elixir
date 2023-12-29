defmodule BillinhoWeb.EnrollmentsController do
  use BillinhoWeb, :controller

  alias Billinho.Enrollments
  alias Billinho.Enrollment

  action_fallback BillinhoWeb.FallbackController

  def index(conn, _params) do
    enrollments = Enrollments.list_enrollments()
    render(conn, "index.json", enrollments: enrollments)
  end

  def show(conn, %{"id" => id}) do
    enrollment = Enrollments.get_enrollment!(id)
    render(conn, "show.json", enrollments: enrollment)
  end

  def create(conn, %{"enrollments" => enrollment_params}) do
    case Enrollments.create(enrollment_params) do
      {:ok, enrollment} ->
        conn
        |> put_status(:created)
        |> put_resp_header(
          "location",
          ~p"/api/enrollments/#{enrollment.id}"
          )
          |> render("show.json", enrollments: enrollment)

          error ->
        error
    end
  end

  def update(conn, %{"id" => id, "enrollments" => enrollment_params}) do
    enrollment = Enrollments.get_enrollment!(id)

    case Enrollments.update_enrollment(
           enrollment,
           enrollment_params
         ) do
      {:ok, %Enrollment{} = enrollment} ->
        conn
        |> put_status(:ok)
        |> put_resp_header(
          "location",
          ~p"/api/enrollments/#{enrollment.id}"
        )
        |> render(:show, enrollments: enrollment)

      error ->
        error
    end
  end

  def delete(conn, %{"id" => id}) do
    enrollment = Enrollments.get_enrollment!(id)

    case Enrollments.delete_enrollment(enrollment) do
      {:ok, %Enrollment{}} ->
        send_resp(conn, :no_content, "")

      error ->
        error
    end
  end
end
