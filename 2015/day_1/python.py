class Santa:
    def __init__(self, file_name):
        f = open(file_name, "r")
        self.santa_map = f.read()
        self.floor = 0

    def find_final_floor(self):
        self.floor = 0
        for direction in list(self.santa_map):
            if direction == "(":
                self.floor += 1
            elif direction == ")":
                self.floor -= 1
        print("Part 1: Santa is now in floor " + str(self.floor))

    def find_basement_position(self):
        self.floor = 0
        for index, direction in enumerate(list(self.santa_map)):
            if direction == "(":
                self.floor += 1
            elif direction == ")":
                self.floor -= 1

            if self.floor == -1:
                position = index + 1
                break

        print(
            "Part 2: The position of the character that causes Santa to first enter the basement is {}".format(
                position
            )
        )


santa = Santa("input.txt")
santa.find_final_floor()
santa.find_basement_position()
