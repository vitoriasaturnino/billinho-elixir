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

    has_many :bills, Billinho.Bill

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(enrollments, attrs) do
    enrollments
    |> cast(attrs, [:amount, :installments, :due_day, :course_name, :educational_institution_id, :student_id])
    |> validate_required([:amount, :installments, :due_day, :course_name, :educational_institution_id, :student_id])
    |> validate_number(:amount, greater_than_or_equal_to: 0)
    |> validate_number(:installments, greater_than_or_equal_to: 1)
    |> validate_number(:due_day, greater_than_or_equal_to: 1, less_than_or_equal_to: 31)
  end
end
