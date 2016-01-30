package queenattack

import (
	"errors"
	"math"
)

// CanQueenAttack determines whether the two provided queen positions
// can attack each other.
func CanQueenAttack(white, black string) (canAttack bool, ok error) {
	if white == black {
		return false, errors.New("Same square")
	}

	wFile := int(white[0] - 'a')
	wRank := int(white[1] - '0')

	bFile := int(black[0] - 'a')
	bRank := int(black[1] - '0')

	if wFile < 0 || wRank < 0 || bFile < 0 || bRank < 0 ||
		wFile > 8 || wRank > 8 || bFile > 8 || bRank > 8 {
		return false, errors.New("Invalid position(s)")
	}

	if wFile == bFile || wRank == bRank {
		return true, nil
	}

	if math.Abs(float64(wFile-bFile)) == math.Abs(float64(wRank-bRank)) {
		return true, nil
	}

	return false, nil
}
