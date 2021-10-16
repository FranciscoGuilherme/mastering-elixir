defmodule Identicon do
  alias Identicon.Image

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Image{hex: hex}
  end

  def pick_color(%Image{hex: [a, b, c | _tail]} = image) do
    %Image{image | color: {a, b, c}}
  end

  def build_grid(%Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk_every(3)
      |> Enum.map(&mirror_row/1)
      |> List.pop_at(5)
      |> then(fn({_, list}) -> list end)
      |> List.flatten
      |> Enum.with_index

    %Image{image | grid: grid}
  end

  def mirror_row([_]), do: nil
  def mirror_row([first, second | _tail] = row) do
    row ++ [second, first]
  end

  def filter_odd_squares(%Image{grid: grid} = image) do
    grid = Enum.filter(grid, fn({code, _index}) ->
      rem(code, 2) == 0
    end)

    %Image{image | grid: grid}
  end

  def build_pixel_map(%Image{grid: grid} = image) do
    pixel_map = Enum.map(grid, fn({_code, index}) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50

      top_left = {horizontal, vertical}
      botton_right = {horizontal + 50, vertical + 50}

      {top_left, botton_right}
    end)

    %Image{image | pixel_map: pixel_map}
  end
end
