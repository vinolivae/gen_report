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
  def read_report(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(&format_line(&1))
    |> Enum.reduce(report_general_acc(), fn line, report ->
      # IO.inspect(line, label: "line")
      # IO.inspect(report, label: "report")

      handle_values(line, report)
    end)
  end

  defp format_line(line) do
    line
    |> String.trim()
    |> String.split(",")
  end

  defp handle_values([name, hours, _day, month, year], %{"all_hours" => freelancers}) do
    all_hours = Map.put(freelancers, name, freelancers[name] + String.to_integer(hours))
    hours_per_month = Map.put(freelancers, name, freelancers[month])
    hours_per_year = Map.put(freelancers, name, freelancers[year])

    build_general_report(all_hours, hours_per_month, hours_per_year)
  end

  defp report_general_acc do
    all_hours = Enum.into(@freelancers, %{}, fn freelancer_name -> {freelancer_name, 0} end)
    hours_per_month = Enum.into(@freelancers, %{}, fn freelancer_name -> {freelancer_name, 0} end)
    hours_per_year = Enum.into(@freelancers, %{}, fn freelancer_name -> {freelancer_name, 0} end)

    build_general_report(all_hours, hours_per_month, hours_per_year)
  end

  defp build_general_report(all_hours, hours_per_month, hours_per_year),
    do: %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
end
