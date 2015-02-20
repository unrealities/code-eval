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
		fmt.Println(findAWriter(scanner.Text()))
	}
}

type messageAndCipher struct {
	encodedMessage []string
	cipher []string
}

func findAWriter(input string) string {
	return decode(parse(input))
}

func parse(input string) (messageAndCipher) {
	splitInput := strings.Split(input, "| ")
	return messageAndCipher {
		strings.Split(splitInput[0], ""),
		strings.Split(splitInput[1], " "),
	}
}

func decode(mc messageAndCipher) string {
	decodedMsg := ""
	for key, _ := range mc.cipher {
		intCipher, _ := strconv.Atoi(mc.cipher[key])
		decodedMsg += mc.encodedMessage[intCipher-1]
	}
	return decodedMsg
}
