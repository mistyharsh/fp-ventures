defmodule TodoStructTest do
  use ExUnit.Case

  test "add() should add item to the struct" do
    todo_struct = TodoStruct.new()

    # keyword list syntax shortcut
    entry = %{date: {2018, 03, 01}, title: "Movies"}

    # SUT
    todo_struct = TodoStruct.add(todo_struct, entry)

    # Assertions
    todo_struct.entries
    |> Map.values()
    |> length
    |> (&(&1 === 1)).()
    |> assert
  end

  test "add() should add item to the struct - 2" do
    # SUT
    todo_list =
      TodoStruct.new()
      |> TodoStruct.add(%{date: {2018, 03, 01}, title: "Movies"})
      |> TodoStruct.add(%{date: {2018, 03, 02}, title: "Games"})

    # Assertion
    todo_list.entries
    |> Map.values()
    |> length
    |> (&(&1 === 2)).()
    |> assert
  end

  test "update() and entryForId() should update the given entry" do

    # Setup data
    todo_list =
      TodoStruct.new()
      |> TodoStruct.add(%{date: {2018, 03, 01}, title: "Movies"})

    # SUT
    todo_list = TodoStruct.update(todo_list, 1, fn (old) -> Map.put(old, :title, "Games") end)
    todo_entry = TodoStruct.entryForId(todo_list, 1)

    # Assertions
    # Maps provies their own syntax
    assert todo_entry.title === "Games"
  end

  test "delete() should delete the entry for given key" do

    # Setup data
    todo_list =
      TodoStruct.new()
      |> TodoStruct.add(%{:date => {2018, 03, 01}, :title => "Movies"})

    # SUT
    todo_list = TodoStruct.delete(todo_list, 1)

    # Assertions
    Map.keys(todo_list.entries)
      |> Kernel.length
      |> (&(&1 === 0)).()       # TODO: This still feels alien and not very clear
      |> assert
  end

  test "entries() should return all entries for given date" do
    todo_list =
      TodoStruct.new
      |> TodoStruct.add(%{date: {2018, 03, 01}, title: "Movies"})
      |> TodoStruct.add(%{date: {2018, 03, 02}, title: "Games"})
      |> TodoStruct.add(%{date: {2018, 03, 01}, title: "Bowling"})

    # SUT
    TodoStruct.entriesForDate(todo_list, {2018, 03, 01})
    |> length
    |> (&(&1 === 2)).()
    |> assert

  end
end
