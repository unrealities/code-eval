package main

import "bufio"
import "log"
import "os"

import "testing"

func TestBitPositions(t *testing.T) {
	expect := [2]bool{true, false}
	inputs := Inputs("../test_input.txt")

	for key, value := range expect {
		result := BitPositions(inputs[key])
		strValue := "false"
		strResult := "false"
		if value == true {
			strValue = "true"
		}
		if result == true {
			strResult = "true"
		}
		if value != result {
			t.Error("Expected: " + strValue + " | Got: " + strResult)
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
