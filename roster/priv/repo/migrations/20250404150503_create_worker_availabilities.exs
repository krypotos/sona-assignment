defmodule Roster.Repo.Migrations.CreateWorkerAvailabilities do
  use Ecto.Migration

  def change do
    create table(:worker_availabilities) do
      add :unavailable_days, {:array, :string}
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:worker_availabilities, [:user_id])
  end
end
