defmodule Pet.Yaml do
  def decode_file(path) do
    {:ok, result} = Yomel.decode_file(path)
    result |> hd
  end
end
