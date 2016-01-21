package triangle

import (
	"math"
	"sort"
)

// KindFromSides determines if a triangle is equilateral, isosceles, or
// scalene.
func KindFromSides(a, b, c float64) Kind {
	if math.IsNaN(a) || math.IsNaN(b) || math.IsNaN(c) {
		return NaT
	}

	sides := []float64{a, b, c}
	sort.Sort(sort.Float64Slice(sides))
	if sides[0] <= 0 || sides[0]+sides[1] <= sides[2] {
		return NaT
	}

	if a == b && b == c {
		return Equ
	} else if a == b || b == c || a == c {
		return Iso
	} else {
		return Sca
	}
}

// Kind represents a type of triangle.
type Kind int8

// Constants representing the the types of triangle.
const (
	Equ Kind = 0
	Iso Kind = 1
	Sca Kind = 2
	NaT Kind = 3
)
