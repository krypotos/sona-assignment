defmodule Roster.Repo.Migrations.CreateWorkTypes do
  use Ecto.Migration

  def change do
    create table(:work_types) do
      add :name, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:work_types, [:name])
  end
end
