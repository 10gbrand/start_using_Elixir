defmodule Testar do
  def test1 do
    data =
      JsonFromFile.get_json("data/traddata.json")
      |> elem(1)
      |> Traddata.traddataJson_to_struct()

    data
  end

  def test2 do
    data =
      JsonFromFile.get_json("data/traddata.json")
      |> elem(1)
      |> Trad.tradJson_to_struct()

    data
  end
end
