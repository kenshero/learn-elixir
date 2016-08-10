defmodule StackTest do
  use ExUnit.Case
  doctest Stack

  test "push 1 pop 1" do
    stack = Stack.start()
    assert Process.alive?(stack)
    assert Stack.push(stack,1) == :ok

  test "start counter" do
    counter = Counter.start()
  end

  test "increse counter + 1" do
    counter = Counter.start()
    assert Counter.increse(counter) == 1
  end

  test "decrese counter - 1" do
    counter = Counter.start()
    assert Counter.increse(counter) == -1
  end

end
