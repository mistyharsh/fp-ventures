defmodule TodoTest.New do
  use ExUnit.Case

  # I don't want doctest for now
  # doctest Todo

  test "new() should create a map" do
    TodoSimple.new()
    |> is_map
    |> assert

    # assert TodoSimple.hello() == :world
  end

  test "new() should create empty map" do
    map = TodoSimple.new()
    keys = Map.keys(map)

    assert keys === []
  end

  test "new() should create empty map - using pipe" do
    # Passing lambda within a pipeline is weird
    TodoSimple.new()
    |> Map.keys()
    |> (fn keys -> keys === [] end).()
    |> assert
  end

  test "new() should create empty map - using pipe 2" do
    lamb = fn keys, val ->
      IO.puts("Test Val: " <> val)
      keys === []
    end

    # Passing lambda within a pipeline is weird
    # Here the first param is automatically injected by pipeline operator
    TodoSimple.new()
    |> Map.keys()
    |> lamb.("Harshal")
    |> assert
  end

  def isEmptyList(list) do
    list === []
  end
end
