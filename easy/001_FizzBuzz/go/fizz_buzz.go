package main

import (
	"bufio"
	"fmt"
	"log"
	"math"
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
		fmt.Println(fizzBuzz(scanner.Text()))
	}
}

type fizzBuzzStruct struct {
	fizz  float64
	buzz  float64
	count int
}

func parse(input string) fizzBuzzStruct {
	splitInput := strings.Split(input, " ")
	fizz, _ := strconv.ParseFloat(splitInput[0], 64)
	buzz, _ := strconv.ParseFloat(splitInput[1], 64)
	count, _ := strconv.Atoi(splitInput[2])

	return fizzBuzzStruct{fizz, buzz, count}
}

func calc(fb fizzBuzzStruct) string {
	result := ""

	for i := 1; i <= fb.count; i++ {
		fi := float64(i)

		if math.Mod(fi, fb.fizz) == 0 {
			result += "F"
		}
		if math.Mod(fi, fb.buzz) == 0 {
			result += "B"
		}
		if math.Mod(fi, fb.fizz) != 0 && math.Mod(fi, fb.buzz) != 0 {
			result += strconv.Itoa(i)
		}

		result += " "
	}

	return strings.Trim(result, " ")
}

func fizzBuzz(input string) string {
	fbs := parse(input)
	return calc(fbs)
}
