defmodule Traddata do

  def trad(id, treeSpecies, diameter, height) do
    trad = %{id: id, treeSpecies: treeSpecies, diameter: diameter, height: height}
    trad
  end

  def tradToTradlist do
    tradlist = []
    tradlist = [trad(1, "Björk", 20, 21)| tradlist]
    tradlist = [trad(2, "Björk", 17, 18)| tradlist]
    tradlist = [trad(3, "Gran", 22, 21)| tradlist]
    tradlist = [trad(4, "Gran", 24, 22)| tradlist]
    tradlist
  end

end

defmodule JsonTest do
  def get_json(filename) do
    with {:ok, body} <- File.read(filename),
         {:ok, json} <- Poison.decode(body), do: {:ok, json}
  end
end

x = JsonTest.get_json("data/traddata.json")
