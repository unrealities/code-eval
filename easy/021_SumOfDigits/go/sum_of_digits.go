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
		fmt.Println(SumOfDigits(scanner.Text()))
	}
}

func SumOfDigits(s string) int {
	sliceOfDigits := strings.Split(s, "")
	sum := 0

	for _, digit := range sliceOfDigits {
		intDigit, _ := strconv.Atoi(digit)
		sum += intDigit
	}

	return sum
}
