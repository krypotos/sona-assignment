defmodule Roster.Scheduling.Shift do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shifts" do
    field :description, :string
    field :start_time, :utc_datetime
    field :end_time, :utc_datetime

    belongs_to :user, Roster.Accounts.User
    belongs_to :work_type, Roster.Scheduling.WorkType

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(shift, attrs) do
    shift
    |> cast(attrs, [:start_time, :end_time, :description, :work_type_id, :user_id])
    |> validate_required([:start_time, :end_time, :description, :work_type_id, :user_id])
  end
end
