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
    |> mirror_row
  end

  def mirror_row([[a, b, c] | rest], list \\ []) do
    list = List.flatten(list, [a, b, c, b, a])

    cond do
      rest == ['A'] -> Enum.chunk_every(list, 5)
      true -> mirror_row(rest, list)
    end
  end
end
