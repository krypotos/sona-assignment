defmodule RosterWeb.ShiftLive.Index do
  use RosterWeb, :live_view
  alias Roster.Scheduling
  alias Roster.Scheduling.Shift
  alias Roster.Accounts

  @impl true
  def mount(_params, _session, socket) do
    shifts = Scheduling.list_shifts()
    work_types = Scheduling.list_work_types()

    changeset = Scheduling.change_shift(%Shift{})

    workers =
      Accounts.list_available_workers_for_shift(
        socket.assigns.current_user.id,
        changeset.params["work_type"]
      )

    socket =
      socket
      |> assign(:page_title, "Manage Shifts")
      |> assign(:shifts, shifts)
      |> assign(:work_types, work_types)
      |> assign(:workers, workers)
      |> assign(:form, to_form(changeset))

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
  end

  @impl true
  def handle_event(
        "validate",
        %{"_target" => ["shift", changed_field], "shift" => shift_params},
        socket
      ) do
    changeset =
      %Shift{}
      |> Shift.changeset(shift_params)
      |> Map.put(:action, :validate)

    IO.inspect(changeset.changes)

    workers =
      if changed_field in ["work_type_id", "start_time", "end_time"] do
        work_type_id =
          if Map.has_key?(changeset.changes, :work_type_id),
            do: changeset.changes.work_type_id,
            else: changeset.data.work_type_id

        start_time =
          if Map.has_key?(changeset.changes, :start_time),
            do: changeset.changes.start_time,
            else: changeset.data.start_time

        end_time =
          if Map.has_key?(changeset.changes, :end_time),
            do: changeset.changes.end_time,
            else: changeset.data.end_time

        Accounts.list_available_workers_for_shift(
          socket.assigns.current_user.id,
          work_type_id,
          start_time,
          end_time
        )
      else
        socket.assigns.workers
      end

    socket =
      socket
      |> assign(:workers, workers)
      |> assign(:form, to_form(changeset))

    {:noreply, socket}
  end

  @impl true
  def handle_event("save", %{"shift" => shift_params}, socket) do
    case Scheduling.create_shift(shift_params) do
      {:ok, _shift} ->
        shifts = Scheduling.list_shifts()

        socket =
          socket
          |> assign(:shifts, shifts)
          |> assign(:form, to_form(Scheduling.change_shift(%Shift{})))
          |> put_flash(:info, "Shift created successfully")

        {:noreply, socket}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    shift = Scheduling.get_shift!(id)
    {:ok, _} = Scheduling.delete_shift(shift)

    shifts = Scheduling.list_shifts()

    socket =
      socket
      |> assign(:shifts, shifts)
      |> put_flash(:info, "Shift deleted successfully")

    {:noreply, socket}
  end
end
