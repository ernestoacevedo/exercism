defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    actions = ["wink", "double wink", "close your eyes", "jump"]
    Integer.digits(code, 2)
    |> Enum.reverse
    |> Stream.with_index
    |> Enum.map(fn({item, i}) ->
        if item == 1, do: Enum.at actions, i
      end)
  end
end
