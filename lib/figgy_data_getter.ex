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
    get_url("https://figgy.princeton.edu/catalog.json")
  end

  def parse_json(json_string) do
    {:ok, json} = Jason.decode(json_string)
    json
  end

  defp get_url(url) do
    url
    |> HTTPoison.get!([], [ ssl: [versions: [:'tlsv1.2']]])
    |> Map.get(:body)
    |> parse_json
  end
end
