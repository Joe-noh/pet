defmodule Pet do
  use GenServer

  def new(config \\ []) do
    GenServer.start_link(__MODULE__, config)
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end

  def get_all(pid) do
    GenServer.call(pid, :get_all)
  end

  ## GenServer callback functions

  def init(config) do
    directory = Keyword.get(config, :directory, "#{System.user_home}/.pit")

    {:ok, read_yaml_files(directory)}
  end

  defp read_yaml_files(directory) do
    profile = "#{directory}/pit.yaml"
      |> Pet.Yaml.decode_file
      |> Map.get("profile")
    Pet.Yaml.decode_file("#{directory}/#{profile}.yaml")
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  def handle_call(:get_all, _from, state) do
    {:reply, state, state}
  end
end
