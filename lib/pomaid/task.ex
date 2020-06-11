defmodule Pomaid.Task do
  @moduledoc "Struct that stores data about tasks"
  defstruct priority: :none, description: ""
  @type t :: %__MODULE__{priority: atom, description: String.t()}
  # @type t(priority, description) :: %__MODULE__{priority: priority, description: description}
end
