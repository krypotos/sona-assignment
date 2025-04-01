defmodule Roster.SchedulingTest do
  use Roster.DataCase

  alias Roster.Scheduling

  describe "shifts" do
    alias Roster.Scheduling.Shift

    import Roster.SchedulingFixtures

    @invalid_attrs %{description: nil, start_time: nil, end_time: nil}

    test "list_shifts/0 returns all shifts" do
      shift = shift_fixture()
      assert Scheduling.list_shifts() == [shift]
    end

    test "get_shift!/1 returns the shift with given id" do
      shift = shift_fixture()
      assert Scheduling.get_shift!(shift.id) == shift
    end

    test "create_shift/1 with valid data creates a shift" do
      valid_attrs = %{description: "some description", start_time: ~U[2025-03-31 16:00:00Z], end_time: ~U[2025-03-31 16:00:00Z]}

      assert {:ok, %Shift{} = shift} = Scheduling.create_shift(valid_attrs)
      assert shift.description == "some description"
      assert shift.start_time == ~U[2025-03-31 16:00:00Z]
      assert shift.end_time == ~U[2025-03-31 16:00:00Z]
    end

    test "create_shift/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scheduling.create_shift(@invalid_attrs)
    end

    test "update_shift/2 with valid data updates the shift" do
      shift = shift_fixture()
      update_attrs = %{description: "some updated description", start_time: ~U[2025-04-01 16:00:00Z], end_time: ~U[2025-04-01 16:00:00Z]}

      assert {:ok, %Shift{} = shift} = Scheduling.update_shift(shift, update_attrs)
      assert shift.description == "some updated description"
      assert shift.start_time == ~U[2025-04-01 16:00:00Z]
      assert shift.end_time == ~U[2025-04-01 16:00:00Z]
    end

    test "update_shift/2 with invalid data returns error changeset" do
      shift = shift_fixture()
      assert {:error, %Ecto.Changeset{}} = Scheduling.update_shift(shift, @invalid_attrs)
      assert shift == Scheduling.get_shift!(shift.id)
    end

    test "delete_shift/1 deletes the shift" do
      shift = shift_fixture()
      assert {:ok, %Shift{}} = Scheduling.delete_shift(shift)
      assert_raise Ecto.NoResultsError, fn -> Scheduling.get_shift!(shift.id) end
    end

    test "change_shift/1 returns a shift changeset" do
      shift = shift_fixture()
      assert %Ecto.Changeset{} = Scheduling.change_shift(shift)
    end
  end

  describe "work_types" do
    alias Roster.Scheduling.WorkType

    import Roster.SchedulingFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_work_types/0 returns all work_types" do
      work_type = work_type_fixture()
      assert Scheduling.list_work_types() == [work_type]
    end

    test "get_work_type!/1 returns the work_type with given id" do
      work_type = work_type_fixture()
      assert Scheduling.get_work_type!(work_type.id) == work_type
    end

    test "create_work_type/1 with valid data creates a work_type" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %WorkType{} = work_type} = Scheduling.create_work_type(valid_attrs)
      assert work_type.name == "some name"
      assert work_type.description == "some description"
    end

    test "create_work_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scheduling.create_work_type(@invalid_attrs)
    end

    test "update_work_type/2 with valid data updates the work_type" do
      work_type = work_type_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %WorkType{} = work_type} = Scheduling.update_work_type(work_type, update_attrs)
      assert work_type.name == "some updated name"
      assert work_type.description == "some updated description"
    end

    test "update_work_type/2 with invalid data returns error changeset" do
      work_type = work_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Scheduling.update_work_type(work_type, @invalid_attrs)
      assert work_type == Scheduling.get_work_type!(work_type.id)
    end

    test "delete_work_type/1 deletes the work_type" do
      work_type = work_type_fixture()
      assert {:ok, %WorkType{}} = Scheduling.delete_work_type(work_type)
      assert_raise Ecto.NoResultsError, fn -> Scheduling.get_work_type!(work_type.id) end
    end

    test "change_work_type/1 returns a work_type changeset" do
      work_type = work_type_fixture()
      assert %Ecto.Changeset{} = Scheduling.change_work_type(work_type)
    end
  end

<<<<<<< HEAD
  describe "worker_availabilities" do
    alias Roster.Scheduling.WorkerAvailability

    import Roster.SchedulingFixtures

    @invalid_attrs %{available: nil, day_of_week: nil}

    test "list_worker_availabilities/0 returns all worker_availabilities" do
      worker_availability = worker_availability_fixture()
      assert Scheduling.list_worker_availabilities() == [worker_availability]
    end

    test "get_worker_availability!/1 returns the worker_availability with given id" do
      worker_availability = worker_availability_fixture()
      assert Scheduling.get_worker_availability!(worker_availability.id) == worker_availability
    end

    test "create_worker_availability/1 with valid data creates a worker_availability" do
      valid_attrs = %{available: true, day_of_week: "some day_of_week"}

      assert {:ok, %WorkerAvailability{} = worker_availability} = Scheduling.create_worker_availability(valid_attrs)
      assert worker_availability.available == true
      assert worker_availability.day_of_week == "some day_of_week"
    end

    test "create_worker_availability/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scheduling.create_worker_availability(@invalid_attrs)
    end

    test "update_worker_availability/2 with valid data updates the worker_availability" do
      worker_availability = worker_availability_fixture()
      update_attrs = %{available: false, day_of_week: "some updated day_of_week"}

      assert {:ok, %WorkerAvailability{} = worker_availability} = Scheduling.update_worker_availability(worker_availability, update_attrs)
      assert worker_availability.available == false
      assert worker_availability.day_of_week == "some updated day_of_week"
    end

    test "update_worker_availability/2 with invalid data returns error changeset" do
      worker_availability = worker_availability_fixture()
      assert {:error, %Ecto.Changeset{}} = Scheduling.update_worker_availability(worker_availability, @invalid_attrs)
      assert worker_availability == Scheduling.get_worker_availability!(worker_availability.id)
    end

    test "delete_worker_availability/1 deletes the worker_availability" do
      worker_availability = worker_availability_fixture()
      assert {:ok, %WorkerAvailability{}} = Scheduling.delete_worker_availability(worker_availability)
      assert_raise Ecto.NoResultsError, fn -> Scheduling.get_worker_availability!(worker_availability.id) end
    end

    test "change_worker_availability/1 returns a worker_availability changeset" do
      worker_availability = worker_availability_fixture()
      assert %Ecto.Changeset{} = Scheduling.change_worker_availability(worker_availability)
    end
  end
=======
>>>>>>> 2df5c82 (remove availability)
end
