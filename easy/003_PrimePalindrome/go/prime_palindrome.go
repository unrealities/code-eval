package main

import "bufio"
import "fmt"
import "log"
import "os"

func main() {
	file, err := os.Open(os.Args[1])
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		fmt.Println(primePalindrome(929))
	}
}

func palindrome(p string) bool {
	pal := false
	if reverse(p) == p {
		pal = true
	}
	return pal
}

func reverse(s string) string {
	r := []rune(s)
	for i, j := 0, len(r)-1; i < len(r)/2; i, j = i+1, j-1 {
		r[i], r[j] = r[j], r[i]
	}
	return string(r)
}

func primePalindrome(maxPrime int) string {
	return "answer"
}
