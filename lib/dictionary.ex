defmodule Dictionary do
  def random_word() do
    word_list()
    |> Enum.random
  end

  def word_list(file \\ "assets/words.txt") do
    file
    |> File.read!
    |> String.split(~r/\n/)
  end
end
