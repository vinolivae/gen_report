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
      IO.inspect(line, label: "line")
      # IO.inspect(report, label: "report")

      handle_values(line, report)
    end)
  end

  defp format_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(2, &String.to_integer/1)
  end

  defp handle_values([name, hours, _days, month, year], %{"all_hours" => freelancer_all_hours, "hours_per_month" => freelancer_hours_month,
  "hours_per_year" => freelancer_hours_year}) do
    all_hours = Map.put(freelancer_all_hours, name, freelancer_all_hours[name] + hours)
    hours_per_month = put_in(freelancer_hours_month, [name, month], 2)
    hours_per_year = put_in(freelancer_hours_year, [name, year], 10)

    build_report(all_hours, hours_per_month, hours_per_year)
  end
  def report_acc do
    all_hours = Enum.into(@freelancers, %{}, fn freelancer_name -> {freelancer_name, 0} end)

    hours_per_month =
      @months
      |> Enum.into(%{}, fn month_name -> {month_name, 0} end)
      |> all_freelancers_name()

    hours_per_year =
      @years
      |> Enum.into(%{}, fn freelancer_name -> {freelancer_name, 0} end)
      |> all_freelancers_name()

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp all_freelancers_name(map_data),
    do: Enum.into(@freelancers, %{}, fn freelancer_name -> {freelancer_name, map_data} end)

  defp build_report(all_hours, hours_per_month, hours_per_year),
    do: %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
end
