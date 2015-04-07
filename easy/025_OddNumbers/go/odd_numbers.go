package main

import "fmt"

func main() {
	numsToPrint := OddNumbers(100)
	for _, num := range numsToPrint {
		fmt.Println(num)
	}
}

func OddNumbers(maxOdd int) []int {
	oddNums := []int{}

	for i := 1; i <= maxOdd; i++ {
		if i%2 != 0 {
			oddNums = append(oddNums, i)
		}
	}

	return oddNums
}
