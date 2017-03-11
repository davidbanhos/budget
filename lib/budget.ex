defmodule Budget do
  alias NimbleCSV.RFC4180, as: CSV

  def list_transactions do
    File.read!("lib/transactions-jan.csv")
    |> parse
    |> filter
  end

  defp parse(string) do
    CSV.parse_string(string)
  end

  defp filter(rows) do
    #Long sintaxe
    #Enum.map(rows, fn(row) -> Enum.drop(row , 1) end)
    Enum.map(rows, &Enum.drop(&1, 1))
  end

end
