package cryptosquare

import (
	"math"
	"regexp"
	"strings"
)

// TestVersion is the version of the test suite this code is written to.
const TestVersion = 1

// Encode encrypts plaintext messages with the square code method.
func Encode(plaintext string) string {
	plaintext = Normalize(plaintext)
	numColumns := int(math.Ceil(math.Sqrt(float64(len(plaintext)))))
	rows := Columns(plaintext, numColumns)

	return strings.Join(rows, " ")
}

// Normalize returns a lowercase plaintext with all non alphabet characters
// removed.
func Normalize(plaintext string) string {
	regex := regexp.MustCompile("\\W")
	plaintext = regex.ReplaceAllString(plaintext, "")
	plaintext = strings.ToLower(plaintext)

	return plaintext
}

// Columns returns the columns of a plaintext. The number of columns is
// specified by the provided size.
func Columns(plaintext string, size int) []string {
	columns := make([]string, size)
	for i, char := range plaintext {
		columns[i%size] += string(char)
	}

	return columns
}
