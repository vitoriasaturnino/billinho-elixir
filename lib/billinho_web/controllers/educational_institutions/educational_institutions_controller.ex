defmodule BillinhoWeb.EducationalInstitutionsController do
  use BillinhoWeb, :controller

  alias Billinho.EducationalInstitutions # context
  alias Billinho.EducationalInstitution # schema

  action_fallback BillinhoWeb.FallbackController

  def index(conn, _params) do
    educational_institutions = EducationalInstitutions.list_educational_institutions()
    render(conn, "index.json", educational_institutions: educational_institutions)
  end

  def show(conn, %{"id" => id}) do
    educational_institution = EducationalInstitutions.get_educational_institution!(id)
    render(conn, "show.json", educational_institutions: educational_institution)
  end

  def create(conn, %{"educational_institutions" => educational_institution_params}) do
    case EducationalInstitutions.create_educational_institution(educational_institution_params) do
      {:ok, educational_institution} ->
        conn
        |> put_status(:created)
        |> put_resp_header(
          "location",
          ~p"/api/educational_institutions/#{educational_institution.id}"
        )
        |> render("show.json", educational_institutions: educational_institution)

      error ->
        error
    end
  end

  @spec update(any(), map()) :: any()
  def update(conn, %{"id" => id, "educational_institutions" => educational_institution_params}) do
    educational_institution = EducationalInstitutions.get_educational_institution!(id)

    case EducationalInstitutions.update_educational_institution(
           educational_institution,
           educational_institution_params
         ) do
      {:ok, %EducationalInstitution{} = educational_institution} ->
        conn
        |> put_status(:ok)
        |> put_resp_header(
          "location",
          ~p"/api/educational_institutions/#{educational_institution.id}"
        )
        |> render(:show, educational_institutions: educational_institution)

      error ->
        error
    end
  end

  def delete(conn, %{"id" => id}) do
    educational_institution = EducationalInstitutions.get_educational_institution!(id)

    case EducationalInstitutions.delete_educational_institution(educational_institution) do
      {:ok, %EducationalInstitution{}} ->
        send_resp(conn, :no_content, "")

      error ->
        error
    end
  end
end
