defmodule Roster.Scheduling do
  @moduledoc """
  The Scheduling context.
  """

  import Ecto.Query, warn: false
  alias Roster.Repo

  alias Roster.Scheduling.Shift

  @doc """
  Returns the list of shifts.

  ## Examples

      iex> list_shifts()
      [%Shift{}, ...]

  """
  def list_shifts do
    Repo.all(Shift)
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
  def get_shift!(id), do: Repo.get!(Shift, id)

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

  alias Roster.Scheduling.WorkType

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

end