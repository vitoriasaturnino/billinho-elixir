defmodule Billinho.Repo.Migrations.CreateTableEducationalInstitutions do
  use Ecto.Migration

  def change do
    create table(:educational_institutions) do
      add :name, :string
      add :cnpj, :string
      add :type, :string

      timestamps(type: :utc_datetime)
    end
  end
end
