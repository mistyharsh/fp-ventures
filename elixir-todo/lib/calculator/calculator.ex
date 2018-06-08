defmodule Calculator do

  def start do
    spawn(fn ->
      initial_state = 0
      loop(initial_state)
    end)
  end

  defp loop(state) do
    new_value = receive do
      { :add, value } -> state + value

      { :value, caller_pid } ->
        send(caller_pid, { :response, state })
        state
    end

    # IO.puts("current state is: #{state}")

    loop(new_value)
  end


  def add(server_pid, value) do
    send(server_pid, { :add, value })
  end

  # def sub(server_pid, value) do

  # end

  # def mult(server_pid, value) do

  # end

  # def division(server_pid, value) do

  # end

  def value(server_pid) do
    caller = self()
    send(server_pid, { :value, caller })

    receive do
      { :response, value } -> value
    after 1000 ->
      { :error, :timeout }
    end

  end

end