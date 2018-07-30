
# Import another file in elixir script mode
Code.require_file("todo.exs", ".")

# Create new struct
todo = Todo.new()

# Empty module
IO.inspect(todo);

# Show options to users
IO.puts "1. Add a new item"
IO.puts "2. Delete item"
IO.puts "3. Show all items"

# Accept input from user
selection = IO.gets "Please make a selection: "

# Show selection
IO.puts "Your selection is: #{selection}"

# Parse the selection from chardata/string to integer
{ option, _ } = Integer.parse(selection)

option = case option do
  1 -> "Add is the operation"
  2 -> "Delete is the operation"
  3 -> "Show all items is the option"
  _ -> "Invalid option"
end

IO.puts(option)