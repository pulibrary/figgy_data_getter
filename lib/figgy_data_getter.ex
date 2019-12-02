defmodule FiggyDataGetter do
  @moduledoc """
  Documentation for FiggyDataGetter.
  """

  @doc """
  Hello world.

  ## Examples

      iex> FiggyDataGetter.hello()
      :world

  """
  def hello do
    :world
  end

  def get_figgy_catalog do
    response = HTTPoison.get!("https://figgy.princeton.edu/catalog.json", [], [ ssl: [versions: [:'tlsv1.2']] ])
    response.body
  end
end
