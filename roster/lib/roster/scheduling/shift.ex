defmodule Roster.Scheduling.Shift do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shifts" do
    field :description, :string
    field :start_time, :utc_datetime
    field :end_time, :utc_datetime
    field :work_type_id, :id
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(shift, attrs) do
    shift
    |> cast(attrs, [:start_time, :end_time, :description])
    |> validate_required([:start_time, :end_time, :description])
  end
end
