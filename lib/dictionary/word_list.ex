defmodule Dictionary.WordList do
  def start_link() do
    Agent.start_link(&word_list/0)
  end

  def random_word(agent) do
    agent |> Agent.get(&Enum.random/1)
  end

  def word_list(file \\ "../../assets/words.txt") do
    file
    |> Path.expand(__DIR__)
    |> File.read!
    |> String.split(~r/\n/)
  end
end
