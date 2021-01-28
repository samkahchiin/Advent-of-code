package main

import (
	"fmt"
	// "strings"
	"io/ioutil"
)

func main() {
	data, err := ioutil.ReadFile("../input.txt")
	if err != nil {
		panic(err)
	}

	fmt.Println(data)
}
