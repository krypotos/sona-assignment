defmodule Roster.Scheduling.WorkType do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Roster.Accounts.User
  alias Roster.Repo

  schema "work_types" do
    field :name, :string
    field :description, :string
    many_to_many :users, User, join_through: "user_work_types"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(work_type, attrs) do
    work_type
    |> cast(attrs, [:name, :description])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end

  @doc """
  Gets a single work_type.
  Raises `Ecto.NoResultsError` if the Work type does not exist.
  """
  def get_work_type!(id), do: Repo.get!(__MODULE__, id)

  @doc """
  Lists all work types.
  """
  def list_work_types do
    Repo.all(__MODULE__)
  end

  @doc """
  Assigns a work type to a user.
  """
  def assign_work_type_to_worker(user, work_type) do
    user = Repo.preload(user, :work_types)

    # Check if the work type is already assigned
    if work_type in user.work_types do
      {:error, "Work type already assigned to this worker"}
    else
      Repo.transaction(fn ->
        # Insert into the join table
        Repo.insert_all("user_work_types", [
          %{
            user_id: user.id,
            work_type_id: work_type.id
          }
        ])

        # Return the updated user with preloaded work types
        Repo.preload(user, :work_types)
      end)
    end
  end

  @doc """
  Unassigns a work type from a user.
  """
  def unassign_work_type_from_worker(user, work_type) do
    user = Repo.preload(user, :work_types)

    # Check if the work type is assigned
    if work_type in user.work_types do
      Repo.transaction(fn ->
        # Delete from the join table
        Repo.delete_all(
          from("user_work_types",
            where: [user_id: ^user.id, work_type_id: ^work_type.id]
          )
        )

        # Return the updated user with preloaded work types
        Repo.preload(user, :work_types)
      end)
    else
      {:error, "Work type not assigned to this worker"}
    end
  end
end
