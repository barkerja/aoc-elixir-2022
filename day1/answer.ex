defmodule Day1 do
  def part_1 do
    {:ok, input} = File.read("input.txt")

    answer =
      input
      |> calculate_calories_by_elf()
      |> Enum.max()

    IO.puts("Part 1 — Answer: #{answer}")
  end

  def part_2 do
    {:ok, input} = File.read("input.txt")

    answer =
      input
      |> calculate_calories_by_elf()
      |> Enum.sort(:desc)
      |> Enum.take(3)
      |> Enum.sum()

    IO.puts("Part 2 — Answer: #{answer}")
  end

  defp calculate_calories_by_elf(input) do
    input
    |> String.split("\n\n", trim: true)
    |> Enum.map(fn calories ->
      calories
      |> String.split("\n", trim: true)
      |> Enum.reduce(0, fn calorie, acc ->
        String.to_integer(calorie) + acc
      end)
    end)
  end
end

Day1.part_1()
Day1.part_2()
