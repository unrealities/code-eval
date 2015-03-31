package main

import (
	"strconv"
	"testing"
)
import "log"
import "bufio"
import "os"

func TestPrimePalindrome(t *testing.T) {
	result := primePalindrome(1000)
	if 929 != result {
		t.Error("Expected: 929" + " | Got: " + strconv.Itoa(result))
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
