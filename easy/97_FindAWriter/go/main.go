package main

import "fmt"
import "log"
import "bufio"
import "os"
import "strconv"
import "strings"

func main() {
	file, err := os.Open(os.Args[1])
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()
		str, num := parse(line)
		fmt.Println(decode(str, num))
	}
}

func parse(input string) ([]string, []string) {
	var split = strings.Split(input, "| ")
	return strings.Split(split[0], ""), strings.Split(split[1], " ")
}

func decode(str []string, num []string) string {
	var msg = ""
	for key, _ := range num {
		int_num, _ := strconv.Atoi(num[key])
		msg += str[int_num-1]
	}
	return msg
}
