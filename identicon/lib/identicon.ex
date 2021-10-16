defmodule Identicon do
  alias Identicon.Image

  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Image{hex: hex}
  end

  def pick_color(image) do
    [a, b, c | _tail] = image.hex

    %Image{image | color: {a, b, c}}
  end
end
