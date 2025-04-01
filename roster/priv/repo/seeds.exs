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

# Create manager
{:ok, manager} = Accounts.register_user(%{
  email: "manager@example.com",
  password: "manager123456",
  role: "manager"
})

# Create workers
{:ok, worker1} = Accounts.register_user(%{
  email: "worker1@example.com",
  password: "worker123456",
  role: "worker"
})

{:ok, worker2} = Accounts.register_user(%{
  email: "worker2@example.com",
  password: "worker123456",
  role: "worker"
})

IO.puts("Created seed users:")
IO.puts("Manager: #{manager.email}")
IO.puts("Worker 1: #{worker1.email}")
IO.puts("Worker 2: #{worker2.email}")
