defmodule Roster.Plugs.RequireRole do
  import Plug.Conn

  def init(required_role), do: required_role

  def call(conn, required_role) do
    user = conn.assigns[:current_user]

    if user && user.role == required_role do
      conn
    else
      conn
      |> Phoenix.Controller.put_flash(:error, "You are not authorized to access this page")
      |> Phoenix.Controller.redirect(to: "/")
      |> halt()
    end
  end
end
