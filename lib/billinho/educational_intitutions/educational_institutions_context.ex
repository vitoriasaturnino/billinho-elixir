defmodule Billinho.EducationalInstitutions do
  import Ecto.Query, warn: false

  alias Billinho.EducationalInstitution
  alias Billinho.Repo

  def list_educational_institutions do
    Repo.all(EducationalInstitution)
  end

  def get_educational_institution!(id) do
    Repo.get!(EducationalInstitution, id)
  end

  def create_educational_institution(attrs \\ %{}) do
    %EducationalInstitution{}
    |> EducationalInstitution.changeset(attrs)
    |> Repo.insert()
  end

  def update_educational_institution(%EducationalInstitution{} = educational_institution, attrs) do
    educational_institution
    |> EducationalInstitution.changeset(attrs)
    |> Repo.update()
  end

  def delete_educational_institution(%EducationalInstitution{} = educational_institution) do
    Repo.delete(educational_institution)
  end
end
