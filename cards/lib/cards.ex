defmodule Cards do
  require Logger

  def hello do
    "hi there!"
  end

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits do
      for value <- values do
        "#{value} of #{suit}"
      end
    end
  end

  def create_deck_ok do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end


  def solving do
    create_deck()
    |> List.flatten()
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
    |> then(fn({head, _}) -> head end)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)

    File.write(filename, binary)
  end

  def read_file(filename) do
    try do
      File.read(filename)
      |> then(fn({_, binary}) ->
        :erlang.binary_to_term(binary)
      end)
    rescue
      ErlangError ->
        Logger.info("Erro ao processar o arquivo: #{filename}")
    end
  end

  def read_file_simple_I(filename) do
    try do
      {_, binary} = File.read(filename)

      :erlang.binary_to_term(binary)
    rescue
      ErlangError ->
        Logger.info("Erro ao processar o arquivo: #{filename}")
    end
  end

  def read_file_simple_II(filename) do
    {status, binary} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "Erro ao processar o arquivo: #{filename}"
    end
  end
end
