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
	for scanner.Scan() {
		fmt.Println(FibonacciSeries(scanner.Text()))
	}
}

func FibonacciSeries(s string) int {
	n, _ := strconv.Atoi(s)
	f := 1
	i := 0
	j := 1

	if n == 0 {
		f = 0
	} else {
		for k := 1; k < n; k++ {
			f = i + j
			i = j
			j = f
		}
	}

	return f
}
