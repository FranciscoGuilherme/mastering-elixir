defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "greets the world" do
    assert Cards.hello() == "hi there!"
  end

  test "create_deck makes 20 cards" do
    assert length(Cards.create_deck_ok) == 20
  end
end
