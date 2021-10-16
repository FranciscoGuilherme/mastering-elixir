defmodule Mapping do
  def maps_structure do
    colors = %{primary: "red", secondary: "blue"}
    %{secondary: secondary_color} = colors
    secondary_color
  end

  def get_map do
    %{pai: "P", mae: "M", filha: "F"}
  end

  def update_maps_function(map_data, key, value) do
    Map.put(map_data, key, value)
  end

  def update_maps_sintax do
    colors = %{primary: "red", secondary: "blue"}
    %{ colors | primary: "yellow" }
  end
end
