ans = case File.read("input.txt") do
    {:ok, body} ->
    body
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn str, total ->
        [a,b,c] = str
        |> String.split("x")
        |> Enum.map(&String.to_integer/1)
        |> Enum.sort()

        total + (3 * a * b + 2 * a * c + 2 * b * c)
    end)
end

IO.puts(ans)
