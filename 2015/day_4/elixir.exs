puzzle_input = "ckczppom"

result = Stream.iterate(0, &(&1+1)) |> Enum.reduce_while(1, fn _, acc ->
    input = "#{puzzle_input}#{acc}"
    hash = :crypto.hash(:md5, input)
    |> Base.encode16()
    <<head :: binary-size(5)>> <> _ = hash
    if head == "00000", do: {:halt, acc}, else: {:cont, acc + 1}
end)

IO.puts(result)

result = Stream.iterate(0, &(&1+1)) |> Enum.reduce_while(1, fn _, acc ->
    input = "#{puzzle_input}#{acc}"
    hash = :crypto.hash(:md5, input)
    |> Base.encode16()
    <<head :: binary-size(6)>> <> _ = hash
    if head == "000000", do: {:halt, acc}, else: {:cont, acc + 1}
end)

IO.puts(result)
