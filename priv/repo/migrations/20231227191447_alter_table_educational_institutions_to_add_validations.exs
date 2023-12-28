defmodule Billinho.Repo.Migrations.AlterTableEducationalInstitutionsToAddValidations do
  use Ecto.Migration

  def change do
    create(unique_index(:educational_institutions, [:name]))
    create(unique_index(:educational_institutions, [:cnpj]))
  end
end
