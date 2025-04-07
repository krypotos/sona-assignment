defmodule Roster.DateUtilsTest do
  use ExUnit.Case
  doctest Roster.DateUtils

  describe "days_of_week/2" do
    test "handles date range spanning multiple weeks" do
      # Sunday
      start_date = ~U[2025-04-06 12:34:56Z]
      # Sunday (2 weeks later)
      end_date = ~U[2025-04-20 12:34:56Z]

      assert Roster.DateUtils.days_of_week(start_date, end_date) == [
               "Sunday",
               "Monday",
               "Tuesday",
               "Wednesday",
               "Thursday",
               "Friday",
               "Saturday"
             ]
    end
  end
end
