lines = open("input.txt", "r").readlines()

total = 0
for line in lines:
    dimension = line.strip().split("x")
    arr = [int(x) for x in dimension]
    [a, b, c] = sorted(arr)

    total += 3 * a * b + 2 * a * c + 2 * b * c

print(total)
