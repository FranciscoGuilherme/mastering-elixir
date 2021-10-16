defmodule Identicon do
  alias Identicon.Image

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Image{hex: hex}
  end

  def pick_color(%Image{hex: [a, b, c | _tail]} = image) do
    #[a, b, c | _tail] = image.hex
    %Image{image | color: {a, b, c}}
  end

  def build_grid(%Image{hex: hex}) do
    hex
    |> Enum.chunk_every(3)
    |> Enum.map(&mirror_row/1)
    |> List.pop_at(5)
    |> then(fn({_, list}) -> list end)
  end

  def mirror_row([_]), do: nil
  def mirror_row([first, second | _tail] = row) do
    row ++ [second, first]
  end
end
