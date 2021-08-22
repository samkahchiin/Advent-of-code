arr = case File.read("input.txt") do
    {:ok, body} ->
    body
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sort()
end

IO.puts(arr)
