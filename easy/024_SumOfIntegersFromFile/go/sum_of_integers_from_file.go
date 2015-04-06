package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
)

func main() {
	file, err := os.Open(os.Args[1])
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()
	scanner := bufio.NewScanner(file)

	fmt.Println(SumOfIntegersFromFile(scanner))
}

func SumOfIntegersFromFile(scanner *bufio.Scanner) int {
	sum := 0

	for scanner.Scan() {
		num, _ := strconv.Atoi(scanner.Text())
		sum += num
	}

	return sum
}
