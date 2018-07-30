# Newline
IO.puts "Hello"

# No new line
IO.write "Please enter your name: "

# Instead of IO.read/1 and IO.write, IO.gets/1 can also be used
name = IO.read(:line)

IO.puts "Welcome back #{name}"

