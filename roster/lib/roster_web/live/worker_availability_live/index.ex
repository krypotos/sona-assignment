defmodule RosterWeb.WorkerAvailabilityLive.Index do
  use RosterWeb, :live_view
  alias Roster.Scheduling

  @impl true
  def mount(_params, _session, socket) do
    current_user = socket.assigns.current_user
    IO.inspect(current_user)

    socket =
      assign(socket,
        days: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
      )

    # Get or create availability record
    case Scheduling.get_or_create_worker_availability(current_user.id) do
      {:ok, availability} ->
        socket =
          socket
          |> assign(:page_title, "Worker Availability")
          |> assign(:availability, availability)
          |> assign(:selected_days, availability.unavailable_days || [])

        {:ok, socket}

      {:error, _changeset} ->
        {:ok, redirect(socket, to: "/")}
    end
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
  end

  @impl true
  def handle_event("toggle_day", %{"day" => day}, socket) do
    selected_days = socket.assigns.selected_days

    new_selected_days =
      if day in selected_days do
        Enum.reject(selected_days, &(&1 == day))
      else
        [day | selected_days]
      end

    # Update the existing availability record
    result =
      Scheduling.update_worker_availability(socket.assigns.availability, %{
        unavailable_days: new_selected_days
      })

    case result do
      {:ok, availability} ->
        socket =
          socket
          |> assign(:availability, availability)
          |> assign(:selected_days, availability.unavailable_days)
          |> put_flash(:info, "Availability updated successfully")

        {:noreply, socket}

      {:error, changeset} ->
        socket =
          socket
          |> put_flash(:error, "Failed to update availability: #{inspect(changeset.errors)}")

        {:noreply, socket}
    end
  end
end
