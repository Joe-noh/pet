defmodule Pet.Yaml do
  def decode_file(path) do
    :yamerl.decode_file(path) |> hd |> transform
  end

  defp transform(list) when is_list(list) do
    if proplist?(list) do
      to_map(list)
    else
      to_string(list)
    end
  end

  defp to_map(keywords) do
    Enum.reduce keywords, %{}, fn ({k, v}, dict) ->
      Map.put(dict, to_string(k), transform(v))
    end
  end

  defp proplist?(list) do
    Enum.all?(list, fn elem ->
      is_tuple(elem) and tuple_size(elem) == 2
    end)
  end
end
