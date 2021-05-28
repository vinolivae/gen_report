defmodule GenReport do
  @moduledoc """
  Generate a report from a csv file.
  """
  alias GenReport.{Calculator, Parser}

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

  @doc """
  generate a report with all freelancers and your hours per month and year

  ##example
  iex> GenReport.read_report("gen_report_test.csv")
  %{
    "all_hours" => all_hours,
    "all_hours_per_month" => hours_per_month,
    "all_hours_per_year" => hours_per_year
  }
  """
  @spec read_report(Binary.t()) :: Map.t()
  def read_report(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report ->
      Calculator.format_all_calculated_values(line, report)
    end)
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
