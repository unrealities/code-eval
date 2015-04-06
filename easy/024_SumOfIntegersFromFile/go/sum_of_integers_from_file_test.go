package main

import (
	"bufio"
	"log"
	"os"
	"strconv"
	"testing"
)

func TestSumOfIntegersFromFile(t *testing.T) {
	value := 17

	file, err := os.Open("../test_input.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()
	scanner := bufio.NewScanner(file)

	result := SumOfIntegersFromFile(scanner)

	if value != result {
		t.Error("Expected: " + strconv.Itoa(value) + " | Got: " + strconv.Itoa(result))
	}
}
