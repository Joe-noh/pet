defmodule PetTest do
  use ExUnit.Case

  test "read profile from .pit/pit.yaml" do
    {:ok, pid} = Pet.new(directory: "test/dot_pit")
    github = Pet.get(pid, "github.com")

    assert Map.get(github, "username") == "Joe_noh"
    assert Map.get(github, "password") == "foobar"
  end

  test "get_all returns whole map" do
    {:ok, pid} = Pet.new(directory: "test/dot_pit")
    map = Pet.get_all(pid)

    assert is_map(map)
    assert Map.has_key?(map, "github.com")
  end
end
