defmodule TodoSimple do
  # A todo list is simple modular abstraction.
  # I should be able to:
  #   1. Initialize list with empty
  #   2. Add entry
  #   3. Update entry
  #   4. Delete entry
  #   5. Get entry
  #   6. Get all entries

  # @spec add(Map, )
  # def add(todo_list, date, title) do
  #   Map.put(todo_list, date, title)
  # end

  def add(todo_list, entry) do
    Map.put(todo_list, entry.date, entry)
  end

  def entries(todo_list) do
    Map.values(todo_list)
  end

  # Create new Todo list
  # Defining a function this way is syntactic sugar
  def new1() do
    %{}
  end

  # Shortcut with syntactice sugar
  def new2, do: %{}

  # Keyword list desugaring
  def new3, do: %{}

  # Keyword list further desugaring
  def new, [{:do, %{}}]
end
