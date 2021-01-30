data = open("input.txt", "r").read()
santa_map = { (0,0): 1 }
coord = [0,0]

for char in data:
    if char == ">":
        coord[0] += 1
    elif char == "<":
        coord[0] -= 1
    elif char == "^":
        coord[1] += 1
    elif char == "v":
        coord[1] -= 1

    key = tuple(coord)
    if santa_map.get(key):
        santa_map[key] = santa_map[key] + 1
    else:
        santa_map.update({key: 1})

ans = 0
for number in santa_map.values():
    if number >= 1:
        ans += 1
    
print(ans)

