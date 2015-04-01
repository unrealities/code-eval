package main

import "testing"
import "log"
import "bufio"
import "os"

func TestReverseWords(t *testing.T) {
	expect := [2]string{
		"World Hello",
		"CodeEval Hello",
	}
	inputs := Inputs("../test_input.txt")

	for key, value := range expect {
		result := ReverseWords(inputs[key])
		if value != result {
			t.Error("Expected: " + value + " | Got: " + result)
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
