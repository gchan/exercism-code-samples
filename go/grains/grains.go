package grains

import "errors"

// Square returns the number of grains on the specified square.
func Square(squares int) (value uint64, err error) {
	if squares <= 0 || squares > 64 {
		return 0, errors.New("Invalid number of squares")
	}

	return 1 << uint(squares-1), nil
}

// Total returns the total number of grains the chessboard.
func Total() uint64 {
	total, _ := Square(64)

	return total*2 - 1
}
