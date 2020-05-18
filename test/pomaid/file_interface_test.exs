defmodule Pomaid.FileInterfaceTest do
  use ExUnit.Case, async: true
  doctest Pomaid.FileInterface
  import Pomaid.FileInterface

  describe "read_todo_txt" do
    test "when the file doesn't exist, it returns an error tuple" do
      assert read_todo_txt("imaginary_file.txt") == {:error, :enoent}
    end

    test "when the file does exist, it returns an ok tuple with the file parsed as a list" do
      {:ok, file} = File.open("todo.txt", [:write])

      IO.binwrite(file, """
        (A) Thank Mom for the meatballs @phone
        (B) Schedule Goodwill pickup +GarageSale @phone
        Post signs around the neighborhood +GarageSale
        @GroceryStore Eskimo pies
      """)

      File.close(file)

      assert read_todo_txt("todo.txt") ==
               {:ok,
                [
                  "(A) Thank Mom for the meatballs @phone",
                  "(B) Schedule Goodwill pickup +GarageSale @phone",
                  "Post signs around the neighborhood +GarageSale",
                  "@GroceryStore Eskimo pies"
                ]}

      File.rm("todo.txt")
    end
  end
end
