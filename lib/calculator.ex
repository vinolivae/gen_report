defmodule GenReport.Calculator do
  @moduledoc """
  responsible for calculate values of csv file
  """

  @spec format_all_calculated_values(List.t(), Map.t()) :: Map.t()
  def format_all_calculated_values([name, hours, _days, month, year], %{
        "all_hours" => freelancer_all_hours,
        "hours_per_month" => freelancer_hours_month,
        "hours_per_year" => freelancer_hours_year
      }) do
    all_hours = calculate_all_hours(freelancer_all_hours, name, hours)
    all_hours_per_month = calculate_hours_per_month(freelancer_hours_month, name, month, hours)
    all_hours_per_year = calculate_hours_per_year(freelancer_hours_year, name, year, hours)

    %{
      "all_hours" => all_hours,
      "hours_per_month" => all_hours_per_month,
      "hours_per_year" => all_hours_per_year
    }
  end

  defp calculate_all_hours(freelancer_all_hours, name, hours),
    do: Map.put(freelancer_all_hours, name, freelancer_all_hours[name] + hours)

  defp calculate_hours_per_month(freelancer_hours_month, name, month, hours) do
    all_hours_per_month =
      Map.put(freelancer_hours_month[name], month, freelancer_hours_month[name][month] + hours)

    freelancer_and_month = Map.put_new(%{}, name, all_hours_per_month)
    Map.merge(freelancer_hours_month, freelancer_and_month)
  end

  defp calculate_hours_per_year(freelancer_hours_year, name, year, hours) do
    all_hours_per_year =
      Map.put(freelancer_hours_year[name], year, freelancer_hours_year[name][year] + hours)

    freelancer_and_year = Map.put_new(%{}, name, all_hours_per_year)
    Map.merge(freelancer_hours_year, freelancer_and_year)
  end
end
