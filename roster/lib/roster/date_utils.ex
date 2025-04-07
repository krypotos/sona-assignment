defmodule Roster.DateUtils do
  @moduledoc """
  A utility module for handling date-related operations in the Roster application.

  This module provides functions for working with dates and date ranges,
  particularly focused on operations needed for shift scheduling and management.
  """

  @doc """
  Returns a list of unique days of the week (as strings) for a given date range.

  The function takes a start date and an end date (both as UTC DateTime) and
  returns a list of the days of the week that fall within that range.
  The days are returned as full names (e.g., "Monday", "Tuesday", etc.).

  ## Parameters

  - `start_date`: The start date of the range (as a UTC DateTime)
  - `end_date`: The end date of the range (as a UTC DateTime)

  ## Returns

  - A list of unique days of the week (as strings)

  ## Examples

      iex> Roster.DateUtils.days_of_week(~U[2025-04-06 12:34:56Z], ~U[2025-04-08 12:34:56Z])
      ["Sunday", "Monday", "Tuesday"]

      iex> Roster.DateUtils.days_of_week(~U[2025-04-06 12:34:56Z], ~U[2025-04-06 12:34:56Z])
      ["Sunday"]
  """
  def days_of_week(start_date, end_date) do
    Date.range(start_date, end_date)
    |> Enum.map(fn date -> Calendar.strftime(date, "%A") end)
    |> Enum.uniq()
  end
end
