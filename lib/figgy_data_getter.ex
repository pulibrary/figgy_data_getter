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

  def get_figgy_catalog(getter \\ FiggyDataGetter) do
    apply(getter, :get_url, ["https://figgy.princeton.edu/catalog.json"])
    |> parse_json
  end


  def parse_json(json_string) when is_binary(json_string) do
    json_string
    |> Jason.decode
    |> parse_json
  end

  def parse_json({:ok, json = %{}}), do: json

  def get_url(url) do
    url
    |> HTTPoison.get!([], [ ssl: [versions: [:'tlsv1.2']] ])
    |> Map.get(:body)
  end
end
