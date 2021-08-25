defmodule ListFilter do
  @moduledoc false

  require Integer

  def call(list) do
    list
    |> filter_numbers()
    |> count_odds()
  end

  defp count_odds(list), do: count_odds(list, 0)

  defp count_odds([], counter), do: counter

  defp count_odds([hd | tl], counter) do
    case Integer.is_odd(hd) do
      true -> count_odds(tl, counter + 1)
      false -> count_odds(tl, counter)
    end
  end

  defp filter_numbers(list) do
    Enum.flat_map(list, &parse_element_to_integer/1)
  end

  defp parse_element_to_integer(elem) do
    case Integer.parse(elem) do
      {int, _} ->
        [int]

      :error ->
        []
    end
  end
end
