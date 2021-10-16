defmodule Cards do
  require Logger

  @moduledoc """
    Teste de documentação de módulo
  """

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

  @doc """
    Teste de documentação de função

  ## Examples
    iex> deck = Cards.create_deck_ok
    iex> deck = Cards.shuffle(deck)
    iex> hand = Cards.deal(deck, 4)
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
    |> then(fn({head, _}) -> head end)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)

    File.write(filename, binary)
  end

  def create_hand, do: []
  def create_hand(hand_size) do
    Cards.create_deck_ok
    |> Cards.shuffle
    |> Cards.deal(hand_size)
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

  def read_file_2(filename) do
    try do
      {_, binary} = File.read(filename)

      :erlang.binary_to_term(binary)
    rescue
      ErlangError ->
        Logger.info("Erro ao processar o arquivo: #{filename}")
    end
  end

  def read_file_3(filename) do
    {status, binary} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "Erro ao processar o arquivo: #{filename}"
    end
  end

  def read_file_4(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "Erro ao processar o arquivo: #{filename}"
    end
  end
end
