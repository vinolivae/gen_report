defmodule GenReport do
  @moduledoc """
  Generate a report from a csv file.
  """
  @freelancers [
    "Daniele",
    "Mayk",
    "Cleiton",
    "Diego",
    "Giuliano",
    "Jakeliny",
    "Joseph",
    "Danilo",
    "Rafael",
    "Vinicius"
  ]
  @months ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
  @years ["2016", "2017", "2018", "2019", "2020"]

  def read_report(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(&format_line(&1))
    |> Enum.reduce(report_acc(), fn line, report ->
      calculate_values(line, report)
    end)
  end

  defp format_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(2, &String.to_integer/1)
  end

  defp calculate_values([name, hours, _days, month, year], %{
         "all_hours" => freelancer_all_hours,
         "hours_per_month" => freelancer_hours_month,
         "hours_per_year" => freelancer_hours_year
       }) do
    all_hours = calculate_all_hours(freelancer_all_hours, name, hours)
    all_hours_per_month = calculate_hours_per_month(freelancer_hours_month, name, month, hours)
    all_hours_per_year = calculate_hours_per_year(freelancer_hours_year, name, year, hours)

    build_report(all_hours, all_hours_per_month, all_hours_per_year)
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

  defp report_acc do
    all_hours = Enum.into(@freelancers, %{}, fn freelancer_name -> {freelancer_name, 0} end)

    hours = Enum.into(@months, %{}, fn month_name -> {month_name, 0} end)
    name_and_hours = Enum.into(@freelancers, %{}, fn name -> {name, hours} end)

    years = Enum.into(@years, %{}, fn year_name -> {year_name, 0} end)
    name_and_years = Enum.into(@freelancers, %{}, fn name -> {name, years} end)

    build_report(all_hours, name_and_hours, name_and_years)
  end

  defp build_report(all_hours, name_and_hours, name_and_years),
    do: %{
      "all_hours" => all_hours,
      "hours_per_month" => name_and_hours,
      "hours_per_year" => name_and_years
    }
end
