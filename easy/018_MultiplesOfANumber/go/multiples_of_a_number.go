package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func main() {
	file, err := os.Open(os.Args[1])
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		fmt.Println(MultiplesOfANumber(scanner.Text()))
	}
}

type xn struct {
	x int
	n int
}

func Parse(input string) xn {
	splitInput := strings.Split(input, ",")
	x, _ := strconv.Atoi(splitInput[0])
	n, _ := strconv.Atoi(splitInput[1])

	return xn{x, n}
}

func MultipleOfANumber(xn xn) int {
	s := xn.n
	for i := 1; xn.x > s; i++ {
		s = xn.n * i
	}
	return s
}

func MultiplesOfANumber(input string) int {
	xn := Parse(input)
	result := MultipleOfANumber(xn)
	return result
}
