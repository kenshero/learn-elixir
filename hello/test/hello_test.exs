defmodule HelloTest do
  use ExUnit.Case
  doctest Hello

  test "the truth" do
    assert Hello.double(2) == 4
  end
end
