defmodule Pomaid.FileInterfaceTest do
  use ExUnit.Case, async: false
  doctest Pomaid.FileInterface
  import Pomaid.FileInterface

  describe "read_todo_file" do
    test "when the file doesn't exist, it returns an error tuple" do
      assert read_todo_file("imaginary_file.txt") == {:error, :enoent}
    end

    test "when the file is a todo.txt file, it returns an ok tuple with the file parsed as a list" do
      {:ok, file} = File.open("test/todo.txt", [:write])

      IO.binwrite(file, """
        (A) Thank Mom for the meatballs @phone
        (B) Schedule Goodwill pickup +GarageSale @phone
        Post signs around the neighborhood +GarageSale
        @GroceryStore Eskimo pies
      """)

      File.close(file)

      assert read_todo_file("test/todo.txt") ==
               {:ok,
                [
                  "(A) Thank Mom for the meatballs @phone",
                  "(B) Schedule Goodwill pickup +GarageSale @phone",
                  "Post signs around the neighborhood +GarageSale",
                  "@GroceryStore Eskimo pies"
                ]}

      File.rm("test/todo.txt")
    end

    test "when the file is a README.md file, it returns an ok tuple with the file parsed as a list" do
      {:ok, file} = File.open("test/README.md", [:write])

      IO.binwrite(file, """
        # Pomaid
        The intention of this project is to be a terminal based task manager with first class pomodoro tracking support

        ## To Do
          - [x] Create basic ratatouille TUI
          - [x] Get OTP app working and tests running
          - [ ] Create Todo, Doing, and Done
          - [ ] Read in todo.txt files
          - [ ] Read in README.md files
          - [ ] Display tasks from files
      """)

      File.close(file)

      assert read_todo_file("test/README.md") ==
               {:ok,
                [
                  "Create Todo, Doing, and Done",
                  "Read in todo.txt files",
                  "Read in README.md files",
                  "Display tasks from files"
                ]}

      File.rm("test/README.md")
    end
  end

  describe "select_todo_file" do
    test "when there is a local README and no path is passed" do
      assert select_todo_file() == {:ok, "README.md"}
    end

    test "when there is a path passed and no todo.txt or README.md" do
      assert select_todo_file("lib") == {:error, "No todo.txt or README.md in path"}
    end

    test "when there is a path passed and a todo.txt in the path" do
      {:ok, file} = File.open("test/todo.txt", [:write])

      IO.binwrite(file, """
        (A) Thank Mom for the meatballs @phone
        (B) Schedule Goodwill pickup +GarageSale @phone
        Post signs around the neighborhood +GarageSale
        @GroceryStore Eskimo pies
      """)

      File.close(file)
      assert select_todo_file("test") == {:ok, "test/todo.txt"}

      File.rm("test/todo.txt")
    end
  end
end
