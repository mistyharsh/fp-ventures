defmodule TodoStruct do
  # Following is shortened to
  # defstruct [{:auto_id, 1}, {:entries, %{}}]

  defstruct auto_id: 1, entries: %{}


  # Create new instance of struct using %ModuleName{}
  def new, do: %TodoStruct{}


  # When all the keys in a map are atoms, you can use the keyword syntax for convenience:
  def add(
        %TodoStruct{auto_id: auto_id, entries: entries} = todo_list,
        entry
      ) do
    # 1. Modify incoming entry and inject id into it
    new_entry = Map.put(entry, :id, auto_id)

    # 2. Put new_entry into entries map
    new_entries = Map.put(entries, auto_id, new_entry)

    # 3. Create/update a struct
    %TodoStruct{todo_list | entries: new_entries, auto_id: auto_id + 1}
  end

  def update(
    %TodoStruct{entries: entries} = todo_list,
    entry_id,
    updater_func
  ) do
    case entries[entry_id] do
      # If entry with given id is not found, then return list
      nil -> todo_list

      old_entry ->

        # 1. Change the entry by calling updater function
        # Fun with pattern matching (Page number 119)
        # If updater_func returns something other than map, then raise error
        new_entry = %{id: ^entry_id} = updater_func.(old_entry)

        # 2. Put changed/updated entry into entries
        entries = Map.put(entries, entry_id, new_entry)

        # 3. Update the struct
        %TodoStruct{todo_list | :entries => entries}
        # Or I can do
        # %TodoStruct{todo_list | entries: entries}

    end
  end

  def delete(todo_list, entry_id) do
    entries = Map.delete(todo_list.entries, entry_id)

    %TodoStruct{todo_list | :entries => entries}
  end


  # Assumption here that id exists
  def entryForId(
    %TodoStruct{entries: entries},
    entry_id
  ) do
    entries[entry_id]
  end


  # Since pattern matching is added, it sort of gives runtime checks to the function
  # If invalid type is passed to function then this function will never be executed
  def entriesForDate(%TodoStruct{entries: entries}, date) do
    entries
    |> Enum.filter(fn ({_, entry}) -> entry.date === date end)
    |> Enum.map(fn ({_, entry}) -> entry end)
  end
end


# {1, %{date: {2018, 3, 1}, id: 1, title: "Movies"}}