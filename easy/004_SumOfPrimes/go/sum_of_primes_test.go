package main

import (
	"strconv"
	"testing"
)
import "log"
import "bufio"
import "os"

func TestSumOfPrimes(t *testing.T) {
	result := SumOfPrimes(1000)
	if 3682913 != result {
		t.Error("Expected: 3682913" + " | Got: " + strconv.Itoa(result))
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
