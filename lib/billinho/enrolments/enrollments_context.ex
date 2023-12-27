defmodule Billinho.Enrollments do
  import Ecto.Query, warn: false

  alias Billinho.Enrollment
  alias Billinho.Repo

  def list_enrollments do
    Repo.all(Enrollment)
  end

  def get_enrollment!(id) do
    Repo.get!(Enrollment, id)
  end

  @spec create_enrollment(
          :invalid
          | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: any()
  def create_enrollment(attrs \\ %{}) do
    %Enrollment{}
    |> Enrollment.changeset(attrs)
    |> Repo.insert()
  end

  def update_enrollment(%Enrollment{} = enrollment, attrs) do
    enrollment
    |> Enrollment.changeset(attrs)
    |> Repo.update()
  end

  def delete_enrollment(%Enrollment{} = enrollment) do
    Repo.delete(enrollment)
  end
end
