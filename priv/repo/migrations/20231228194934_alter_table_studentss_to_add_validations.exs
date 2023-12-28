defmodule Billinho.Repo.Migrations.AlterTableStudentsToAddValidations do
  use Ecto.Migration

  def change do
    create(unique_index(:students, [:cpf]))
  end
end
