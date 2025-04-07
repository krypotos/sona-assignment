defmodule RosterWeb.WorkerLive.Index do
  use RosterWeb, :live_view
  alias Roster.Accounts
  alias Roster.Scheduling.WorkType

  def mount(_params, _session, socket) do
    workers = Accounts.list_workers()
    work_types = WorkType.list_work_types()

    {:ok,
     socket
     |> assign(:workers, workers)
     |> assign(:work_types, work_types)
     |> assign(:page_title, "Workers")}
  end

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
  end

  def handle_event(
        "assign_work_type",
        %{"worker_id" => worker_id, "work_type_id" => work_type_id},
        socket
      ) do
    worker = Accounts.get_user!(worker_id)
    work_type = WorkType.get_work_type!(work_type_id)

    case WorkType.assign_work_type_to_worker(worker, work_type) do
      {:ok, _} ->
        workers = Accounts.list_workers()

        {:noreply,
         socket
         |> put_flash(:info, "Work type assigned successfully")
         |> assign(:workers, workers)}

      {:error, reason} ->
        {:noreply,
         socket
         |> put_flash(:error, reason)}
    end
  end

  def handle_event(
        "unassign_work_type",
        %{"worker_id" => worker_id, "work_type_id" => work_type_id},
        socket
      ) do
    worker = Accounts.get_user!(worker_id)
    work_type = WorkType.get_work_type!(work_type_id)

    case WorkType.unassign_work_type_from_worker(worker, work_type) do
      {:ok, _} ->
        workers = Accounts.list_workers()

        {:noreply,
         socket
         |> put_flash(:info, "Work type unassigned successfully")
         |> assign(:workers, workers)}

      {:error, reason} ->
        {:noreply,
         socket
         |> put_flash(:error, reason)}
    end
  end

  defp get_available_work_types(worker, all_work_types) do
    assigned_work_type_ids = Enum.map(worker.work_types || [], & &1.id)
    Enum.reject(all_work_types, &(&1.id in assigned_work_type_ids))
  end
end
