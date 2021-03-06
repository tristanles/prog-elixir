defmodule StrBin do
  def printable?(w), do: Enum.all?(w, fn c -> c >= ?\s and c <= ?~ end)

  def anagram?(w1, w2), do: Enum.sort(w1) === Enum.sort(w2)

  def calc(expr), do: _calc([], [], [], expr)
  defp _calc(num1, ?+, num2, []), do: parse(num1) + parse(num2)
  defp _calc(num1, ?-, num2, []), do: parse(num1) - parse(num2)
  defp _calc(num1, ?*, num2, []), do: parse(num1) * parse(num2)
  defp _calc(num1, ?/, num2, []), do: parse(num1) / parse(num2)
  defp _calc(num1, [], [], [h|t]) when h in '+-*/', do: _calc(num1, h, [], t)
  defp _calc(num1, [], [], [h|t]), do: _calc([h|num1], [], [], t)
  defp _calc(num1, operand, num2, [h|t]), do: _calc(num1, operand, [h|num2], t)

  def parse(num_char_list) do
    Enum.reverse(num_char_list) |> to_string |> String.strip |> String.to_integer
  end

  def center(strs) do
    max_length = strs |> Enum.map(&String.length/1) |> Enum.max
    strs |> Enum.map(fn str -> _pad(str, max_length) end) |> Enum.map(&IO.puts/1)
  end

  defp _pad(str, padding) do
    required_padding = padding - String.length(str)
    required_padding = required_padding
    _do_pad(str, required_padding)
  end

  defp _do_pad(str, n) when n <= 0, do: str
  defp _do_pad(str, n), do: _do_pad(" "<>str<>" ", n-2)

end
