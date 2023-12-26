defmodule Billinho.Repo.Migrations.CreateTableStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string
      add :cpf, :string
      add :birth_date, :date
      add :phone_number, :string
      add :genre, :string
      add :payment_method, :string

      timestamps(type: :utc_datetime)
    end
  end
end
