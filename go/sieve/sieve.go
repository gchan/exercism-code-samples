package sieve

// Sieve uses the Sieve of Eratosthenes to find all primes up to
// the given number.
func Sieve(upto int) []int {
	candidates := make([]bool, upto)
	var primes []int

	for i, notPrime := range candidates {
		if !notPrime && i > 1 {
			primes = append(primes, i)

			for j := i * 2; j < upto; j += i {
				candidates[j] = true
			}
		}
	}

	return primes
}
