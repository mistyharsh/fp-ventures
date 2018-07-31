
# Import another file in elixir script mode
Code.require_file("todo.exs", ".")

# Define required lambdas
new_struct = fn -> Todo.new() end

show_menu = fn ->
  IO.puts "1. Add a new item"
  IO.puts "2. Delete item"
  IO.puts "3. Show all items"
  selection = IO.gets "Please make a selection: "

  # Parse the selection from chardata/string to integer
  { option, _ } = Integer.parse(selection)
  option
end

perform_operation = fn(todo_list, option) ->
  case option do
    1 -> Todo.add(todo_list, %{:title => "Hello"})
    2 -> Todo.delete(todo_list, 2)
    _ ->
      IO.puts "Invalid Option"
      todo_list
  end
end

main = fn(todo_list) ->

  # Show options to users
  # And accept input from user
  option = show_menu.()

  # Show selection
  IO.puts "Your selection is: #{option}"

  todo_list = perform_operation.(todo_list, option)

  IO.inspect(todo_list)
end


# This is not recursion
repl = fn(todo_list, loop) ->
  todo_list = main.(todo_list)
  loop.(todo_list, loop)
end

# Create initial new struct
todo_list = new_struct.()

# Start REPL
repl.(todo_list, repl)