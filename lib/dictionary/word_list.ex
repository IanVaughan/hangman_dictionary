defmodule Dictionary.WordList do
  @name __MODULE__

  def start_link() do
    Agent.start_link(&word_list/0, name: @name)
  end

  def random_word() do
    @name |> Agent.get(&Enum.random/1)
  end

  def word_list(file \\ "../../assets/words.txt") do
    file
    |> Path.expand(__DIR__)
    |> File.read!
    |> String.split(~r/\n/)
  end
end
