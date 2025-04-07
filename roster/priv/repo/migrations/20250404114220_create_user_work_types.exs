defmodule Roster.Repo.Migrations.CreateUserWorkTypes do
  use Ecto.Migration

  def change do
    create table(:user_work_types) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :work_type_id, references(:work_types, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:user_work_types, [:user_id, :work_type_id])
  end
end
