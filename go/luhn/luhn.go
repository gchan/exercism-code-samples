package luhn

import (
	"strconv"
	"strings"
)

// AddCheck calculates the check digit of the provided number as
// per the Luhn algorithm.
func AddCheck(numberStr string) string {
	sum := Sum(numberStr + "0")

	checkDigit := sum * 9 % 10

	return numberStr + strconv.Itoa(checkDigit)
}

// Valid determines if the provided number is valid as per the
// Luhn algorithm.
func Valid(numberStr string) bool {
	sum := Sum(numberStr)

	return sum > 0 && sum%10 == 0
}

// Sum calculates the sum of the provided number as per the
// Luhn algorithm.
func Sum(numberStr string) (sum int) {
	numbers := strings.Replace(numberStr, " ", "", -1)

	for i := 0; i < len(numbers); i++ {
		digit, _ := strconv.Atoi(numbers[i : i+1])

		if (len(numbers)-i)%2 == 0 {
			double := digit * 2
			sum += double/10 + double%10
		} else {
			sum += digit
		}
	}

	return
}
