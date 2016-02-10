package pythagorean

import "math"

// Triplet is a set of three natural numbers, {a, b, c}, for which,
// a**2 + b**2 = c**2.
type Triplet [3]int

// Range returns a list of all Pythagorean triplets with sides in the
// range min to max inclusive.
func Range(min, max int) (triplet []Triplet) {
	for a := min; a <= max; a++ {
		for b := min; b <= max; b++ {
			cf := math.Sqrt(float64(a*a + b*b))
			c := int(cf)

			if c <= max && cf == math.Floor(cf) && IsTriplet(a, b, c) {
				triplet = append(triplet, Triplet{a, b, c})
			}
		}
	}

	return
}

// Sum returns a list of all Pythagorean triplets where the sum a+b+c
// (the perimeter) is equal to p.
func Sum(p int) (triplet []Triplet) {
	for a := 1; a < p; a++ {
		for b := 1; b < p-a; b++ {
			c := p - a - b

			if IsTriplet(a, b, c) {
				triplet = append(triplet, Triplet{a, b, c})
			}
		}
	}

	return
}

// IsTriplet returns true if the provided parameters is a Pythagorean triplet
// and a < b < c.
func IsTriplet(a, b, c int) bool {
	return a < b && b < c && a*a+b*b == c*c
}
