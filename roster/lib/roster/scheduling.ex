defmodule Roster.Scheduling do
  @moduledoc """
  The Scheduling context.
  """

  import Ecto.Query, warn: false
  alias Roster.Repo

  alias Roster.Scheduling.Shift
  alias Roster.Scheduling.WorkType

  @doc """
  Returns the list of shifts.

  ## Examples

      iex> list_shifts()
      [%Shift{}, ...]

  """
  def list_shifts do
    Shift
    |> preload([:work_type, :user])
    |> Repo.all()
  end

  @doc """
  Gets a single shift.

  Raises `Ecto.NoResultsError` if the Shift does not exist.

  ## Examples

      iex> get_shift!(123)
      %Shift{}

      iex> get_shift!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shift!(id) do
    Shift
    |> preload([:work_type, :user])
    |> Repo.get!(id)
  end

  @doc """
  Creates a shift.

  ## Examples

      iex> create_shift(%{field: value})
      {:ok, %Shift{}}

      iex> create_shift(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shift(attrs \\ %{}) do
    %Shift{}
    |> Shift.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shift.

  ## Examples

      iex> update_shift(shift, %{field: new_value})
      {:ok, %Shift{}}

      iex> update_shift(shift, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shift(%Shift{} = shift, attrs) do
    shift
    |> Shift.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shift.

  ## Examples

      iex> delete_shift(shift)
      {:ok, %Shift{}}

      iex> delete_shift(shift)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shift(%Shift{} = shift) do
    Repo.delete(shift)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shift changes.

  ## Examples

      iex> change_shift(shift)
      %Ecto.Changeset{data: %Shift{}}

  """
  def change_shift(%Shift{} = shift, attrs \\ %{}) do
    Shift.changeset(shift, attrs)
  end

  @doc """
  Returns the list of work_types.

  ## Examples

      iex> list_work_types()
      [%WorkType{}, ...]

  """
  def list_work_types do
    Repo.all(WorkType)
  end

  @doc """
  Gets a single work_type.

  Raises `Ecto.NoResultsError` if the Work type does not exist.

  ## Examples

      iex> get_work_type!(123)
      %WorkType{}

      iex> get_work_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_work_type!(id), do: Repo.get!(WorkType, id)

  @doc """
  Creates a work_type.

  ## Examples

      iex> create_work_type(%{field: value})
      {:ok, %WorkType{}}

      iex> create_work_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_work_type(attrs \\ %{}) do
    %WorkType{}
    |> WorkType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a work_type.

  ## Examples

      iex> update_work_type(work_type, %{field: new_value})
      {:ok, %WorkType{}}

      iex> update_work_type(work_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_work_type(%WorkType{} = work_type, attrs) do
    work_type
    |> WorkType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a work_type.

  ## Examples

      iex> delete_work_type(work_type)
      {:ok, %WorkType{}}

      iex> delete_work_type(work_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_work_type(%WorkType{} = work_type) do
    Repo.delete(work_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking work_type changes.

  ## Examples

      iex> change_work_type(work_type)
      %Ecto.Changeset{data: %WorkType{}}

  """
  def change_work_type(%WorkType{} = work_type, attrs \\ %{}) do
    WorkType.changeset(work_type, attrs)
  end

  alias Roster.Scheduling.WorkerAvailability

  @doc """
  Returns the list of worker_availabilities.

  ## Examples

      iex> list_worker_availabilities()
      [%WorkerAvailability{}, ...]

  """
  def list_worker_availabilities do
    Repo.all(WorkerAvailability)
  end

  @doc """
  Gets a single worker_availability.

  Raises `Ecto.NoResultsError` if the Worker availability does not exist.

  ## Examples

      iex> get_worker_availability!(123)
      %WorkerAvailability{}

      iex> get_worker_availability!(456)
      ** (Ecto.NoResultsError)

  """
  def get_worker_availability!(id), do: Repo.get!(WorkerAvailability, id)

  @doc """
  Creates a worker_availability.

  ## Examples

      iex> create_worker_availability(%{field: value})
      {:ok, %WorkerAvailability{}}

      iex> create_worker_availability(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_worker_availability(attrs \\ %{}) do
    %WorkerAvailability{}
    |> WorkerAvailability.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a worker_availability.

  ## Examples

      iex> update_worker_availability(worker_availability, %{field: new_value})
      {:ok, %WorkerAvailability{}}

      iex> update_worker_availability(worker_availability, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_worker_availability(%WorkerAvailability{} = worker_availability, attrs) do
    worker_availability
    |> WorkerAvailability.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a worker_availability.

  ## Examples

      iex> delete_worker_availability(worker_availability)
      {:ok, %WorkerAvailability{}}

      iex> delete_worker_availability(worker_availability)
      {:error, %Ecto.Changeset{}}

  """
  def delete_worker_availability(%WorkerAvailability{} = worker_availability) do
    Repo.delete(worker_availability)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking worker_availability changes.

  ## Examples

      iex> change_worker_availability(worker_availability)
      %Ecto.Changeset{data: %WorkerAvailability{}}

  """
  def change_worker_availability(%WorkerAvailability{} = worker_availability, attrs \\ %{}) do
    WorkerAvailability.changeset(worker_availability, attrs)
  end

  @doc """
  Gets a worker's availability by user_id.
  Returns nil if no availability record exists.
  """
  def get_worker_availability_by_user(user_id) do
    query =
      from wa in WorkerAvailability,
        where: wa.user_id == ^user_id,
        select: wa

    Repo.one(query)
  end

  @doc """
  Gets or creates a worker availability record for a user.
  Ensures each user has exactly one record.
  """
  def get_or_create_worker_availability(user_id) do
    case get_worker_availability_by_user(user_id) do
      nil ->
        create_worker_availability(%{user_id: user_id, unavailable_days: []})

      availability ->
        {:ok, availability}
    end
  end
end
