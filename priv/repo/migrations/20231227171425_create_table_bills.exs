defmodule Billinho.Repo.Migrations.CreateTableBills do
  use Ecto.Migration

  def change do
    create table(:bills) do
      add :amount, :float
      add :due_date, :date
      add :status, :string
      add :enrollment_id, references(:enrollments)

      timestamps(type: :utc_datetime)
    end
  end
end
