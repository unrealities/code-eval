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
		fmt.Println(maxRangeSum(scanner.Text()))
	}
}

type maxRange struct {
	days  int
	gains []int
}

func parse(input string) maxRange {
	splitInput := strings.Split(input, ";")
	gainsSlice := strings.Split(splitInput[1], " ")
	intGainsSlice := make([]int, len(gainsSlice))

	for key, gains := range gainsSlice {
		intGainsSlice[key], _ = strconv.Atoi(gains)
	}

	days, _ := strconv.Atoi(splitInput[0])

	return maxRange{
		days,
		intGainsSlice,
	}
}

func maxRangeSum(input string) int {
	maxRange := parse(input)
	maxStart := len(maxRange.gains) - maxRange.days + 1
	maxGain := 0
	currGain := 0

	for i := 0; i < maxStart; i++ {
		currGain = 0
		for j := i; j < i+maxRange.days; j++ {
			currGain += maxRange.gains[j]
		}
		if currGain > maxGain {
			maxGain = currGain
		}
	}

	return maxGain
}
