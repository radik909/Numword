defmodule Numword do
  alias Numword.Dictionary
  @chunks 3..7

  def run(num_string) when is_binary(num_string) and byte_size(num_string) == 10 do
    num_string
    |> String.codepoints()
    |> map_to_values()
    |> convert_to_words()
    |> divide_into_chunks()
    |> cross_refer_dictionary(Dictionary.value())
  end

  defp map_to_values(numword_chars) do
    numword_chars
    |> Enum.map(&Map.fetch!(mapper(), &1))
  end

  defp convert_to_words([head | remain]) do
    convert_to_words(head, remain)
  end

  defp convert_to_words(words, [head | []]) do
    combine(words, head)
  end

  defp convert_to_words(words, [head | remain]) do
    combine(words, head)
    |> convert_to_words(remain)
  end

  defp combine(words, head) do
    combine(words, head, [])
  end

  defp combine(words, [head | []], result) do
    result ++ Enum.map(words, &(&1 <> head))
  end

  defp combine(words, [head | remain], result) do
    combine(words, remain, result ++ Enum.map(words, &(&1 <> head)))
  end

  defp divide_into_chunks(words) do
    Enum.map(words, fn word ->
      Enum.map(@chunks, &String.split_at(word, &1))
    end)
  end

  defp cross_refer_dictionary(words_set, dictionary) do
    Enum.map(words_set, fn words ->
      Enum.map(words, fn {word1, word2} ->
        with {:ok, _} <- Map.fetch(dictionary, word1),
             {:ok, _} <- Map.fetch(dictionary, word2) do
          [word1, word2]
        else
          _ -> nil
        end
      end)
      |> Enum.filter(&(!is_nil(&1)))
    end)
    |> Enum.filter(&(&1 != []))
  end

  def mapper do
    %{
      "2" => ~w(A B C),
      "3" => ~w(D E F),
      "4" => ~w(G H I),
      "5" => ~w(J K L),
      "6" => ~w(M N O),
      "7" => ~w(P Q R S),
      "8" => ~w(T U V),
      "9" => ~w(W X Y Z)
    }
  end
end
