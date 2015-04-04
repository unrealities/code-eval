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
		fmt.Println(BitPositions(scanner.Text()))
	}
}

type bp struct {
	num       int64
	firstPos  int64
	secondPos int64
}

func BitPositions(input string) bool {
	bp := Parse(input)
	strNum := strconv.FormatInt(bp.num, 2)
	sliceNum := strings.Split(strNum, "")
	r := Reverse(sliceNum)

	equal := false

	if r[bp.firstPos-1] == r[bp.secondPos-1] {
		equal = true
	}

	return equal
}

func Parse(input string) bp {
	splitInput := strings.Split(input, ",")
	num, _ := strconv.ParseInt(splitInput[0], 10, 64)
	firstPos, _ := strconv.ParseInt(splitInput[1], 10, 8)
	secondPos, _ := strconv.ParseInt(splitInput[2], 10, 8)

	return bp{num, firstPos, secondPos}
}

func Reverse(s []string) []string {
	for i, j := 0, len(s)-1; i < j; i, j = i+1, j-1 {
		s[i], s[j] = s[j], s[i]
	}
	return s
}
