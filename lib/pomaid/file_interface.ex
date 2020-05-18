defmodule Pomaid.FileInterface do
  @moduledoc """
    File Interface:
    provides functions for reading and writing to files, specifically at todo.txt file and a done.txt file
  """

  @doc "Reads file from <path> and returns :ok/:error tuple ok: with list"
  def read_todo_txt(path) do
    case File.read(path) do
      {:error, e} ->
        {:error, e}

      {:ok, contents} ->
        {:ok, parse_todo_txt(contents)}
    end
  end

  @doc ~S"""
   Takes a  raw file and splits it by lines, trimming whitespace and removing blank lines
   ## Examples

          iex> Pomaid.FileInterface.parse_todo_txt("one\n   two\n\n")
          ["one", "two"]

  """
  def parse_todo_txt(raw_file_contents) do
    raw_file_contents
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&(&1 != ""))
  end
end
