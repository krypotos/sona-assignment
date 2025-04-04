# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Roster.Repo.insert!(%Roster.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Roster.Accounts
alias Roster.Scheduling.WorkType
alias Roster.Repo

# Clean up existing data
IO.puts("Cleaning up existing data...")
Repo.delete_all("user_work_types")
Repo.delete_all("users")
Repo.delete_all("work_types")

# Create manager
{:ok, manager} =
  Accounts.register_user(%{
    email: "manager@example.com",
    password: "manager123456",
    role: "manager"
  })

# Create workers
{:ok, worker1} =
  Accounts.register_user(%{
    email: "worker1@example.com",
    password: "worker123456",
    role: "worker"
  })

{:ok, worker2} =
  Accounts.register_user(%{
    email: "worker2@example.com",
    password: "worker123456",
    role: "worker"
  })

# Create work types
work_types = [
  %{
    name: "Cleaning",
    description: "General cleaning and maintenance tasks"
  },
  %{
    name: "Cooking",
    description: "Food preparation and cooking"
  },
  %{
    name: "Security",
    description: "Security and safety monitoring"
  },
  %{
    name: "Reception",
    description: "Front desk and customer service"
  }
]

# Insert work types
Enum.each(work_types, fn work_type_attrs ->
  %WorkType{}
  |> WorkType.changeset(work_type_attrs)
  |> Repo.insert!()
end)

IO.puts("\nSeed completed successfully!")
IO.puts("\nCreated users:")
IO.puts("Manager: #{manager.email}")
IO.puts("Worker 1: #{worker1.email}")
IO.puts("Worker 2: #{worker2.email}")
IO.puts("\nCreated work types:")
Enum.each(work_types, fn %{name: name} -> IO.puts("- #{name}") end)
