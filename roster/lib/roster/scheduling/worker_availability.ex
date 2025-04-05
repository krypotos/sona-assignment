defmodule Roster.Scheduling.WorkerAvailability do
  use Ecto.Schema
  import Ecto.Changeset

  schema "worker_availabilities" do
    field :unavailable_days, {:array, :string}
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(worker_availability, attrs) do
    worker_availability
    |> cast(attrs, [:unavailable_days, :user_id])
    |> validate_required([:unavailable_days, :user_id])
  end
end
