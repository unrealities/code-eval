package main

import (
	"bufio"
	"log"
	"os"
	"strconv"
	"testing"
)

func TestSumOfDigits(t *testing.T) {
	expect := [2]int{5, 19}
	inputs := Inputs("../test_input.txt")

	for key, value := range expect {
		result := SumOfDigits(inputs[key])
		if value != result {
			t.Error("Expected: " + strconv.Itoa(value) + " | Got: " + strconv.Itoa(result))
		}
	}
}

func Inputs(filePath string) [2]string {
	file, err := os.Open(filePath)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	inputs := [2]string{}
	i := 0

	for scanner.Scan() {
		inputs[i] = scanner.Text()
		i++
	}

	return inputs
}
