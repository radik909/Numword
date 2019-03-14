defmodule Numword.Dictionary do
  use Agent
  require Logger
  @file_name "dictionary.txt"

  def start_link(_args) do
    Agent.start_link(
      fn ->
        with {:ok, path} <- File.cwd(),
             {:ok, file} <- File.read("#{path}/lib/numword/#{@file_name}") do
          Logger.info("Successfully read the file #{@file_name}")

          file
          |> String.split("\n", trim: true)
          |> Enum.reduce(%{}, &Map.put(&2, &1, &1))
        else
          {:error, :enoent} ->
            Logger.error("Cannot read the #{@file_name}")
            %{}

          {:error, _} ->
            Logger.error("Check file permissions for #{@file_name}")
            %{}
        end
      end,
      name: __MODULE__
    )
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end
end
