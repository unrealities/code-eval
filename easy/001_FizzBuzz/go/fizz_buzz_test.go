package main

import "testing"
import "log"
import "bufio"
import "os"

func TestFizzBuzz(t *testing.T) {
	expect := [2]string{
		"1 2 F 4 B F 7 8 F B",
		"1 F 3 F 5 F B F 9 F 11 F 13 FB 15",
	}
	inputs := Inputs("../test_input.txt")

	for key, value := range expect {
		result := fizzBuzz(inputs[key])
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
