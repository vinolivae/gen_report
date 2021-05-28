defmodule GenReport.Parser do
  @moduledoc """
  Parse csv file data
  """

  @spec parse_file(Binary.t()) :: Stream.t()
  def parse_file(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(&parse_line(&1))
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(2, &String.to_integer/1)
  end
end
