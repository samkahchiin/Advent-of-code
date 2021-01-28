position = case File.read("input.txt") do
    {:ok, body} ->
    body
    |> String.split(~r{\B}, trim: true)
    |> Enum.reduce(0, fn x, floor ->
        case x do
            "(" -> floor + 1
            ")" -> floor - 1
            _ -> floor
        end
    end)
end


IO.puts("Santa Claus is at level #{position}")


position_tuple = case File.read("input.txt") do
    {:ok, body} ->
    body
    |> String.split(~r{\B}, trim: true)
    |> Enum.reduce_while({0, 0}, fn(direction, {idx, floor}) -> 
        floor = case direction do
            "(" -> floor + 1
            ")" -> floor - 1
            _ -> floor
        end
        if floor == -1, do: {:halt, {idx + 1, floor}}, else: {:cont, {idx + 1, floor}}
    end)
end

{idx, _} = position_tuple

IO.puts("Part 2: The position of the character that causes Santa to first enter the basement is #{idx}")
