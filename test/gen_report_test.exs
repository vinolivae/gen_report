defmodule GenReportTest do
  use ExUnit.Case

  describe "read_report/1" do
    test "builds the report" do
      filename = "gen_report_test.csv"
      response = GenReport.read_report(filename)

      expected_response = %{
        "all_hours" => %{
          "Cleiton" => 5,
          "Daniele" => 7,
          "Danilo" => 8,
          "Diego" => 1,
          "Giuliano" => 3,
          "Jakeliny" => 1,
          "Joseph" => 6,
          "Mayk" => 4,
          "Rafael" => 3,
          "Vinicius" => 8
        },
        "hours_per_month" => %{
          "Cleiton" => %{
            "1" => 0,
            "10" => 0,
            "11" => 0,
            "12" => 5,
            "2" => 0,
            "3" => 0,
            "4" => 0,
            "5" => 0,
            "6" => 0,
            "7" => 0,
            "8" => 0,
            "9" => 0
          },
          "Daniele" => %{
            "1" => 0,
            "10" => 0,
            "11" => 0,
            "12" => 0,
            "2" => 0,
            "3" => 0,
            "4" => 7,
            "5" => 0,
            "6" => 0,
            "7" => 0,
            "8" => 0,
            "9" => 0
          },
          "Danilo" => %{
            "1" => 0,
            "10" => 0,
            "11" => 0,
            "12" => 0,
            "2" => 0,
            "3" => 0,
            "4" => 0,
            "5" => 0,
            "6" => 0,
            "7" => 8,
            "8" => 0,
            "9" => 0
          },
          "Diego" => %{
            "1" => 0,
            "10" => 0,
            "11" => 0,
            "12" => 1,
            "2" => 0,
            "3" => 0,
            "4" => 0,
            "5" => 0,
            "6" => 0,
            "7" => 0,
            "8" => 0,
            "9" => 0
          },
          "Giuliano" => %{
            "1" => 0,
            "10" => 0,
            "11" => 0,
            "12" => 0,
            "2" => 3,
            "3" => 0,
            "4" => 0,
            "5" => 0,
            "6" => 0,
            "7" => 0,
            "8" => 0,
            "9" => 0
          },
          "Jakeliny" => %{
            "1" => 0,
            "10" => 0,
            "11" => 0,
            "12" => 0,
            "2" => 0,
            "3" => 0,
            "4" => 0,
            "5" => 0,
            "6" => 1,
            "7" => 0,
            "8" => 0,
            "9" => 0
          },
          "Joseph" => %{
            "1" => 0,
            "10" => 0,
            "11" => 0,
            "12" => 0,
            "2" => 6,
            "3" => 0,
            "4" => 0,
            "5" => 0,
            "6" => 0,
            "7" => 0,
            "8" => 0,
            "9" => 0
          },
          "Mayk" => %{
            "1" => 0,
            "10" => 0,
            "11" => 0,
            "12" => 4,
            "2" => 0,
            "3" => 0,
            "4" => 0,
            "5" => 0,
            "6" => 0,
            "7" => 0,
            "8" => 0,
            "9" => 0
          },
          "Rafael" => %{
            "1" => 0,
            "10" => 0,
            "11" => 0,
            "12" => 0,
            "2" => 0,
            "3" => 3,
            "4" => 0,
            "5" => 0,
            "6" => 0,
            "7" => 0,
            "8" => 0,
            "9" => 0
          },
          "Vinicius" => %{
            "1" => 0,
            "10" => 0,
            "11" => 0,
            "12" => 0,
            "2" => 0,
            "3" => 0,
            "4" => 0,
            "5" => 0,
            "6" => 0,
            "7" => 8,
            "8" => 0,
            "9" => 0
          }
        },
        "hours_per_year" => %{
          "Cleiton" => %{"2016" => 5, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "Daniele" => %{"2016" => 0, "2017" => 0, "2018" => 7, "2019" => 0, "2020" => 0},
          "Danilo" => %{"2016" => 8, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          "Diego" => %{"2016" => 0, "2017" => 1, "2018" => 0, "2019" => 0, "2020" => 0},
          "Giuliano" => %{"2016" => 0, "2017" => 0, "2018" => 3, "2019" => 0, "2020" => 0},
          "Jakeliny" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 1},
          "Joseph" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 6, "2020" => 0},
          "Mayk" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 4, "2020" => 0},
          "Rafael" => %{"2016" => 0, "2017" => 3, "2018" => 0, "2019" => 0, "2020" => 0},
          "Vinicius" => %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 8}
        }
      }

      assert response == expected_response
    end
  end
end
