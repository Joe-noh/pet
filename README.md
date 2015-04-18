# Pet

This is an account management tool, compat with [pit](https://github.com/cho45/pit).

**currently only reading is supported**

## Usage

```elixir
iex> {:ok, p} = Pet.new
{:ok, #PID<0.110.0>}
iex> Pet.get(p, "github.com")
%{"username" => "Joe_noh", "password" => "foobar"}
```

## Contributing

Very, very welcomed.
