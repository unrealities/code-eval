package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
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

func MultiplesOfANumber(input string) string {
	return "result"
}
