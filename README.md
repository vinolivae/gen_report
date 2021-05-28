# Report Generator

**TODO: Generate a report from a csv file**

### Alert
Check the feat/gen-report-with-parallelism branch for the same solution, but using parallelism!

Look for the read_report_from_many function for more details.

### Problem
Given a csv file containing name, hours, day, month and year of 10 freelancers, return all hours, hours per month and hours per year.

### Tips
> Consider 30 days in every month.

> Do not consider leap year.

> See the the lib files to learn how to run with iex.
---
### Example Table
| Names  | Hours |  Day  | Month | Year |
| ------ | :---: | :---: | :---: | ---: |
| name 1 |  10   |   5   |   1   | 2016 |
| name 2 |  18   |  30   |   2   | 2017 |
| name 3 |  17   |  10   |   3   | 2018 |
| name 4 |  18   |   7   |   4   | 2019 |
| name 5 |   6   |  25   |  12   | 2020 |
---
### First run and test
    mix deps.get
    mix compile
    mix test 
___

### Try it
- See the lib files and read the @doc.
- Open iex with command ```iex -S mix```.
- Run the line ```iex> <code_to_run>``` in your iex.

### The Expected Output Looks like this
~~~elixir
%{
  all_hours: %{
        name: all_hours,
        name: all_hours,
        ...
    },
  hours_per_month: %{
        name: %{
            month: hours_per_month,
            month: hours_per_month,
            ...
        },
        name: %{
            month: hours_per_month,
            month: hours_per_month,
            ...
        }
    },
  hours_per_year: %{
        name: %{
            year: hours_per_year,
            year: hours_per_year,
            ...
        },
        name: %{
            year: hours_per_year,
            year: hours_per_year,
            ...
        }
    }
}
~~~
