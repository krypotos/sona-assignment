defmodule Roster.SchedulingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Roster.Scheduling` context.
  """

  @doc """
  Generate a shift.
  """
  def shift_fixture(attrs \\ %{}) do
    {:ok, shift} =
      attrs
      |> Enum.into(%{
        description: "some description",
        end_time: ~U[2025-03-31 16:00:00Z],
        start_time: ~U[2025-03-31 16:00:00Z]
      })
      |> Roster.Scheduling.create_shift()

    shift
  end

  @doc """
  Generate a unique work_type name.
  """
  def unique_work_type_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a work_type.
  """
  def work_type_fixture(attrs \\ %{}) do
    {:ok, work_type} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: unique_work_type_name()
      })
      |> Roster.Scheduling.create_work_type()

    work_type
  end

  @doc """
  Generate a worker_availability.
  """
  def worker_availability_fixture(attrs \\ %{}) do
    {:ok, worker_availability} =
      attrs
      |> Enum.into(%{
        unavailable_days: ["option1", "option2"]
      })
      |> Roster.Scheduling.create_worker_availability()

    worker_availability
  end
end
