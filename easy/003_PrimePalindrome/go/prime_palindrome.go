package main

import (
	"fmt"
	"math"
	"strconv"
)

func main() {
	fmt.Println(primePalindrome(1000))
}

func possiblePrimes(maxPrime int) []int {
	pp := make([]int, maxPrime-2)
	for i := 2; i < maxPrime; i++ {
		pp[i-2] = i
	}

	for _, possible_prime := range pp {
		for key, non_prime := range pp {
			if (math.Mod(float64(non_prime), float64(possible_prime)) == 0) &&
				(non_prime/possible_prime != 1) {
				pp[key] = 0
			}
		}
	}

	clean_pp := []int{}

	for _, prime := range pp {
		if prime != 0 {
			clean_pp = append(clean_pp, prime)
		}
	}

	return clean_pp
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

func primePalindrome(maxPrime int) int {
	pp := possiblePrimes(maxPrime)
	max := 2

	for i := len(pp) - 1; i >= 0; i-- {
		if palindrome(strconv.Itoa(pp[i])) {
			if pp[i] > max {
				max = pp[i]
				break
			}
		}
	}

	return max
}
