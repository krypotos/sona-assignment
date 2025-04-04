defmodule Roster.Scheduling.WorkType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "work_types" do
    field :name, :string
    field :description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(work_type, attrs) do
    work_type
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
    |> unique_constraint(:name)
  end
end
