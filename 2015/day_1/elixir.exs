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


