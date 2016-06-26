package binary

import (
	"errors"
	"regexp"
)

func ParseBinary(binary string) (int, error) {
	if !regexp.MustCompile("\\A[01]*\\z").MatchString(binary) {
		return 0, errors.New("Not a binary number")
	}

	result := 0
	for i, bit := range binary {
		if bit == '1' {
			result += 1 << uint((len(binary) - i - 1))
		}
	}

	return result, nil
}
