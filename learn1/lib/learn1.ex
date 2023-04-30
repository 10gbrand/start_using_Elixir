defmodule Trad do
  defstruct [:ytId, :id, :treeSpecies, :diameter, :height]

  def tradJson_to_struct(traddata) do
    # Gör om listan på enskillda träd till struct
    treeList = traddata["TreeList"]
    ytId = traddata["Id"]

    Enum.map(treeList, fn val ->
      # val["Diameter"]
      %Trad{
        ytId: ytId,
        id: val["Id"],
        treeSpecies: val["TreeSpecies"],
        diameter: val["Diameter"],
        height: val["Height"]
      }
    end)
  end
end

defmodule Traddata do
  defstruct [:id, :areal, :easting, :northing, :treeList, :totNr]

  def traddataJson_to_struct(traddata) do
    %Traddata{
      id: traddata["Id"],
      areal: traddata["Areal"],
      easting: traddata["Easting"],
      northing: traddata["Northing"],
      treeList: Trad.tradJson_to_struct(traddata)
      # att göra: lägga till en summering at träden.
      # totNr: Trad.tradJson_to_struct(traddata) |> |> Enum.sum()
    }
  end
end

defmodule JsonFromFile do
  def get_json(filename) do
    with {:ok, body} <- File.read(filename), {:ok, json} <- Poison.decode(body), do: {:ok, json}
  end
end

# x = JsonFromFile.get_json("data/traddata.json")
