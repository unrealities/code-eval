package main

import "fmt"
import "math"

func main() {
	fmt.Println(SumOfPrimes(1000))
}

func SumOfPrimes(count int) int {
	primes := FirstNPrimes(count)
	sum := 0

	for _, prime := range primes {
		sum += prime
	}

	return sum
}

func FirstNPrimes(n int) []int {
	pp := make([]int, n)
	c := 1
	i := 0

	for p := 2; c <= n; p++ {
		if IsPrime(p) {
			pp[i] = p
			i++
			c++
		}
	}

	return pp
}

func IsPrime(p int) bool {
	prime := true

	for i := 2; float64(i) <= math.Sqrt(float64(p)); i++ {
		if math.Mod(float64(p), float64(i)) == 0 {
			prime = false
			break
		}
	}

	return prime
}
