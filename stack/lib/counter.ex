defmodule Counter do
  def start() do
    spawn fn -> process(0) end
  end


  def process(count) do
    receive do
      {:push, n} -> process([n|count])
    end
  end

end


# {:ok , counter} = Agent.start(fn -> 0 end) 

# Agent.update(counter , fn n -> n + 1 end )

# Agent.get(counter , fn n -> n end )

# Agent.update(counter , fn n -> n + 1 end )

# Agent.get(counter , fn n -> n end )