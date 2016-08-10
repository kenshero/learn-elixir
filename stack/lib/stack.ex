defmodule Stack do
  def start() do
    spawn fn -> process([]) end
  end

  def push(stack,n) do
    send(stack, {:push ,n})
    :ok
  end

  def pop(stack) do
    send(stack,{:pop , self() })
    receive do
      {:result, n} -> n
    end
  end

  def process(list) do
    receive do
      {:push, n} -> process([n|list])
      {:pop, pid} ->
        case list do
          [n | tail] ->
            send(pid,{:result, n})
            process(tail)
          _->
            send(pid,{:result, nil})
            process(list)
        end
    end
  end

end
