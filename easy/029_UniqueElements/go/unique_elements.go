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
		fmt.Println(UniqueElements(scanner.Text()))
	}
}

func UniqueElements(input string) string {
	sliceOfStrings := strings.Split(input, ",")
	sliceOfInts := []int{}

	for _, str := range sliceOfStrings {
		num, _ := strconv.Atoi(str)
		sliceOfInts = append(sliceOfInts, num)
	}

	uniqSliceOfInts := Unique(sliceOfInts)

	returnString := ""
	for _, val := range uniqSliceOfInts {
		returnString += strconv.Itoa(val)
		returnString += ","
	}

	returnString = strings.TrimRight(returnString, ",")

	return returnString
}

func Unique(s []int) []int {
	r := []int{}

	for _, num := range s {
		flag := false
		for _, uniq := range r {
			if num == uniq {
				flag = true
			}
		}
		if flag == false {
			r = append(r, num)
		}
	}

	return r
}
