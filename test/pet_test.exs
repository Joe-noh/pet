defmodule PetTest do
  use ExUnit.Case

  setup do
    {:ok, _} = Pet.start_link(directory: "test/dot_pit", name: Pet.Server)
    :ok
  end

  test "read profile from .pit/pit.yaml" do
    github = Pet.get(Pet.Server, "github.com")

    assert Map.get(github, "username") == "Joe_noh"
    assert Map.get(github, "password") == "foobar"
  end

  test "get_all returns whole map" do
    map = Pet.get_all(Pet.Server)

    assert is_map(map)
    assert Map.has_key?(map, "github.com")
  end
end
