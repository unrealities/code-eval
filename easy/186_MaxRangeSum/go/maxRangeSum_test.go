package main

import (
	"bufio"
	"log"
	"os"
	"strconv"
	"testing"
)

func TestMaxRangeSum(t *testing.T) {
	expect := [3]string{
		"16",
		"0",
		"17",
	}
	inputs := Inputs("../test_input.txt")

	for key, value := range expect {
		result := strconv.Itoa(maxRangeSum(inputs[key]))
		if value != result {
			t.Error("Expected: " + value + " | Got: " + result)
		}
	}
}

func Inputs(filePath string) [3]string {
	file, err := os.Open(filePath)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	inputs := [3]string{}
	i := 0

	for scanner.Scan() {
		inputs[i] = scanner.Text()
		i++
	}

	return inputs
}
