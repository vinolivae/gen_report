defmodule GenReport.ParserTest do
  use ExUnit.Case
  alias GenReport.Parser

  describe "parse_file/1" do
    test "parse the file" do
      filename = "gen_report_test.csv"

      response =
        filename
        |> Parser.parse_file()
        |> Enum.map(& &1)

      expected_response = [
        ["Daniele", 7, 29, "4", "2018"],
        ["Mayk", 4, 9, "12", "2019"],
        ["Cleiton", 5, 27, "12", "2016"],
        ["Diego", 1, 2, "12", "2017"],
        ["Giuliano", 3, 13, "2", "2018"],
        ["Jakeliny", 1, 22, "6", "2020"],
        ["Joseph", 6, 18, "2", "2019"],
        ["Danilo", 8, 18, "7", "2016"],
        ["Rafael", 3, 17, "3", "2017"],
        ["Vinicius", 8, 19, "7", "2020"]
      ]

      assert response == expected_response
    end
  end
end
