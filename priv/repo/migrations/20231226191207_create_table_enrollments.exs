defmodule Billinho.Repo.Migrations.CreateTableEnrollments do
  use Ecto.Migration

  def change do
    create table(:enrollments) do
      add :amount, :float
      add :installments, :integer
      add :due_day, :integer
      add :course_name, :string
      add :educational_institution_id, references(:educational_institutions)
      add :student_id, references(:students)

      timestamps(type: :utc_datetime)
    end
  end
end
