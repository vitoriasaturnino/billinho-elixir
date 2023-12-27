defmodule BillinhoWeb.EducationalInstitutionsJSON do
  alias Billinho.EducationalInstitution

  @doc """
  Renders a list of educational_institutions.
  """
  def index(%{educational_institutions: educational_institutions}) do
    %{data: for(educational_institutions <- educational_institutions, do: data(educational_institutions))}
  end

  @doc """
  Renders a single educational_institutions.
  """
  def show(%{educational_institutions: educational_institutions}) do
    %{data: data(educational_institutions)}
  end

  defp data(%EducationalInstitution{} = educational_institutions) do
    %{
      id: educational_institutions.id,
      name: educational_institutions.name,
      cnpj: educational_institutions.cnpj,
      type: educational_institutions.type
    }
  end
end
