# This needs to be moved
defmodule MockedGetter do
  def get_url(_url) do
    docs = [%{"state_tesim" => "foo"}]
    Jason.encode!(%{"response" => %{"docs" => docs}})
  end
end

defmodule FiggyDataGetterTest do
  use ExUnit.Case
  doctest FiggyDataGetter

  test "greets the world" do
    assert FiggyDataGetter.hello() == :world
  end

  test "retrieves the JSON from the Figgy endpoint" do
    assert %{"response" => response} = FiggyDataGetter.get_figgy_catalog(MockedGetter)
    # Extract the first document from the list keyed to "docs"
    assert %{"docs" => [doc | _]} = response
    assert %{"state_tesim" => _} = doc
  end
end
