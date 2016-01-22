package diffsquares

// SquareOfSums returns the square of the sum of numbers from 1 to N.
func SquareOfSums(n int) int {
	sum := float64(1+n) * (float64(n) / 2)
	return int(sum * sum)
}

// SumOfSquares returns the sum of squares from 1 to N.
func SumOfSquares(n int) (sum int) {
	for i := 1; i <= n; i++ {
		sum += i * i
	}
	return sum
}

// Difference returns the difference between the sum of the squares and
// the square of the sums of the first N natural numbers
func Difference(n int) int {
	return SquareOfSums(n) - SumOfSquares(n)
}
