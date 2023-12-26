defmodule Billinho.Students do
  import Ecto.Query, warn: false

  alias Billinho.Student
  alias Billinho.Repo

  def list_students do
    Repo.all(Student)
  end

  def get_student!(id) do
    Repo.get!(Student, id)
  end

  def create_student(attrs \\ %{}) do
    %Student{}
    |> Student.changeset(attrs)
    |> Repo.insert()
  end

  def update_student(%Student{} = student, attrs) do
    student
    |> Student.changeset(attrs)
    |> Repo.update()
  end

  def delete_student(%Student{} = student) do
    Repo.delete(student)
  end
end
