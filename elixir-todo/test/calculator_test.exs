defmodule CalculatorTest do
  use ExUnit.Case


  test "start() should initialize to calculator to 0" do
    calculator_pid = Calculator.start

    value = Calculator.value(calculator_pid)

    assert(value === 0)

  end

  test "add() should add given value" do

    calculator_pid = Calculator.start

    Calculator.add(calculator_pid, 10)
    Calculator.add(calculator_pid, 30)

    value = Calculator.value(calculator_pid)

    assert(value === 40)

  end

  # TODO: Incomplete work. Pending items are add, sub, mult and division

end