package raindrops

import "strconv"

// TestVersion is the version of the test suite this code is written to.
const TestVersion = 1

// Convert converts a number to a string, the contents of which depends on
// the number's prime factors.
//
// - If the number contains 3 as a prime factor, output 'Pling'.
// - If the number contains 5 as a prime factor, output 'Plang'.
// - If the number contains 7 as a prime factor, output 'Plong'.
// - If the number does not contain 3, 5, or 7 as a prime factor, just pass
//   the number's digits straight through.
func Convert(num int) string {
	var str string

	if num%3 == 0 {
		str += "Pling"
	}
	if num%5 == 0 {
		str += "Plang"
	}
	if num%7 == 0 {
		str += "Plong"
	}
	if len(str) == 0 {
		str = strconv.Itoa(num)
	}

	return str
}
