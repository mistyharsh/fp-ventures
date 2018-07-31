defmodule Todo do

  defstruct auto_id: 1, entries: %{}

  def new, do: %Todo{}

  # Add new item
  # Short syntax can be used if all the keys are atoms
  def add(
    %Todo{:auto_id => auto_id, :entries => entries} = todo_list,
    entry
  ) do

    # 1. Modify incoming entry and inject id into it
    entry = Map.put(entry, :id, auto_id)

    # 2. Push new entry to the map
    entries = Map.put(entries, auto_id, entry)

    # 3. Create/update a struct (again keyword list shortcut can be used)
    %Todo{todo_list | :entries => entries, :auto_id => auto_id + 1}

  end

  def get_all(%Todo{entries: entries}) do
    entries
  end

  def delete(todo_list, id) do
    entries = Map.delete(todo_list.entries, id)

    %{todo_list | :entries => entries }
  end

end