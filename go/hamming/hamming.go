package hamming

import "errors"

// TestVersion is the version of the test suite this code is written to.
const TestVersion = 2

// Distance calculates the Hamming difference between two DNA strands
func Distance(dnaOne, dnaTwo string) (distance int, err error) {
	if len(dnaOne) != len(dnaTwo) {
		return 0, errors.New("Stands are not the same length")
	}

	for i := range dnaOne {
		if dnaOne[i] != dnaTwo[i] {
			distance++
		}
	}

	return distance, nil
}
