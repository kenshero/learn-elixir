defmodule Hello do
    def say do
        IO.puts "Hello"
    end

    def factorial(0) do
        1
    end

    def factorial(1) do
        1
    end

    def factorial(n) do
        n * factorial(n-1)
    end

    def head([h|_]) do
        h
    end

    def double_list(l) do
        case l do
            [] -> []
            [h|t] -> [h * 2 | double_list(t)]
        end
    end

    def reverse_list(l) do
        reverse_list(l,[])
    end

    defp reverse_list(l,acc) do
        case l do
            [] -> acc
            [h|t] -> reverse_list(t, [h | acc])
        end
    end

    def sum(l) do
        sum(l,0)
    end

    defp sum(l, acc) do
        case l do
            [] -> acc
            [h|t] -> sum(t, h + acc)
        end
    end

    def map(l, func) do
        case l do
            [] -> []
            [h|t] -> [func.(h) | map(t,func)]
        end
    end

    def reduce(l, acc, func) do
        case l do
            [] -> acc
            [h|t] -> reduce(t, func.(h,acc), func)
        end
    end

    def process(sender) do
        IO.puts "Sleep"
        :timer.sleep(10_000)
        send(sender, "Die")
    end

    def process() do
        receive do
            msg -> IO.puts msg
        end
    end
end