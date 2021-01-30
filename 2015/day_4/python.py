import hashlib

puzzle_input = 'ckczppom'
number = 1

while True:
    magic_string = puzzle_input + str(number)
    result = hashlib.md5(magic_string.encode()).hexdigest()
    if result[0:5] == "00000":
        break
    else:
        number += 1

print(number)

while True:
    magic_string = puzzle_input + str(number)
    result = hashlib.md5(magic_string.encode()).hexdigest()
    if result[0:6] == "000000":
        break
    else:
        number += 1

print(number)
