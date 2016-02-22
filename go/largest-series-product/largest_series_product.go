package lsproduct

import (
	"errors"
	"regexp"
	"strconv"
)

// TestVersion is the version of the test suite this code is written to.
const TestVersion = 2

// LargestSeriesProduct returns the largest product for a series of
// consecutive digits of length n.
func LargestSeriesProduct(digits string, span int) (max int, err error) {
	valid, _ := regexp.MatchString("\\A\\d*\\z", digits)

	if len(digits) < span || !valid || span < 0 {
		return 0, errors.New("Invalid inputs")
	}

	for i := 0; i <= len(digits)-span; i++ {
		product := Product(digits[i : i+span])
		if product > max {
			max = product
		}
	}

	return max, nil
}

// Product returns the product of all digits in the provided string.
func Product(digits string) int {
	product := 1

	for i := 0; i < len(digits); i++ {
		digit, _ := strconv.Atoi(digits[i : i+1])
		product *= digit
	}

	return product
}
