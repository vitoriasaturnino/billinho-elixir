defmodule Billinho.Enrollment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "enrollments" do
    field :amount, :float
    field :installments, :integer
    field :due_day, :integer
    field :course_name, :string

    belongs_to :educational_institution, Billinho.EducationalInstitution
    belongs_to :student, Billinho.Student
  end

  @doc false
  def changeset(enrollments, attrs) do
    enrollments
    |> cast(attrs, [:amount, :installments, :due_day, :course_name])
    |> validate_required([:amount, :installments, :due_day, :course_name])
  end
end
