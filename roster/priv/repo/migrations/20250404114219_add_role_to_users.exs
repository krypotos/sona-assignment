defmodule Roster.Repo.Migrations.AddRoleToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :role, :string, null: false, default: "manager"
    end

    create constraint(:users, :valid_role, check: "role IN ('manager', 'worker')")
  end
end
