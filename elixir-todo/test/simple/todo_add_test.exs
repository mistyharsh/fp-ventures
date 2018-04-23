defmodule TodoTest.Add do
  use ExUnit.Case

  test "add() should add item to the list" do
    # SUT
    todo_list =
      TodoSimple.new()
      |> TodoSimple.add(%{:date => {2018, 03, 01}, :title => "Movies"})
      |> TodoSimple.add(%{:date => {2018, 03, 02}, :title => "Games"})

    todo_list
    |> Map.keys()
    |> length
    |> (&(&1 === 2)).()
    |> assert
  end

  test "entries() should return all the entries" do
    todo_list =
      TodoSimple.new()
      |> TodoSimple.add(%{date: {2018, 03, 01}, title: "Movies"})
      |> TodoSimple.add(%{date: {2018, 03, 02}, title: "Games"})

    # SUT
    entries = TodoSimple.entries(todo_list)

    assert(
      entries === [
        %{date: {2018, 03, 01}, title: "Movies"},
        %{date: {2018, 03, 02}, title: "Games"}
      ]
    )

    assert length(entries) === 2
  end
end
