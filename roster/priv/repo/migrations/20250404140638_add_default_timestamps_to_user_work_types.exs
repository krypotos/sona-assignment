defmodule Roster.Repo.Migrations.AddDefaultTimestampsToUserWorkTypes do
  use Ecto.Migration

  def change do
    alter table(:user_work_types) do
      modify :inserted_at, :utc_datetime, default: fragment("NOW()")
      modify :updated_at, :utc_datetime, default: fragment("NOW()")
    end
  end
end
