package main

import (
	"fmt"
	"strings"
	"io/ioutil"
)

func main() {
	data, err := ioutil.ReadFile("../input.txt")
	if err != nil {
		panic(err)
	}

	var floor int
	var position int

	count := 0
	arr := strings.Split(string(data), "") 
	for idx, direction := range arr {
		if direction == "(" {
			floor += 1
		} else if direction == ")" {
			floor -= 1
		}

		if count == 0 && floor == -1 {
			position = idx + 1
		}
	}
	fmt.Println("Part 1: the instructions take Santa to", floor,"floor")
	fmt.Println("Part 2: The position of the character that causes Santa to first enter the basement is", position)
}
