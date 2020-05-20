defmodule Pomaid.FileInterface do
  @moduledoc """
    File Interface:
    provides functions for reading and writing to files, specifically at todo.txt file and a done.txt file
    ! Warning !
    many of the functions in this mondule contain side effects
  """

  @doc "This function is pretty gross, try to think of a cleaner way to write it"
  def select_todo_file(path \\ "") do
    {:ok, files} =
      case path do
        "" -> File.ls()
        _ -> File.ls(String.trim(path))
      end

    updated_path =
      case path do
        "" -> ""
        _ -> path <> "/"
      end

    cond do
      Enum.member?(files, "README.md") ->
        {:ok, updated_path <> "README.md"}

      Enum.member?(files, "todo.txt") ->
        {:ok, updated_path <> "todo.txt"}

      true ->
        {:error, "No todo.txt or README.md in path"}
    end
  end

  def read_todo_file(path) do
    case File.read(path) do
      {:error, e} ->
        {:error, e}

      {:ok, contents} ->
        cond do
          String.contains?(path, "README.md") -> {:ok, parse_readme(contents)}
          true -> {:ok, parse_todo_txt(contents)}
        end
    end
  end

  @doc ~S"""
   Takes a raw todo.txt file and splits it by lines, trimming whitespace and removing blank lines
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

  @doc ~S"""
   Takes a raw README.md file and extract the TODO from it
   ## Examples

          iex> Pomaid.FileInterface.parse_readme("# README\n one\n   two\n\n - [ ] task1\n - [ ] task 2\n\n")
          ["task1", "task 2"]

  """
  def parse_readme(raw_file_contents) do
    raw_file_contents
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&(&1 != ""))
    |> Enum.filter(&String.starts_with?(&1, ["- [ ]", "-[ ]"]))
    |> Enum.map(&(String.split(&1, "] ") |> List.last()))
  end
end
