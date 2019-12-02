defmodule FiggyDataGetterTest do
  use ExUnit.Case
  doctest FiggyDataGetter

  test "greets the world" do
    assert FiggyDataGetter.hello() == :world
  end
end
