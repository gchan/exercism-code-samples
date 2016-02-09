package summultiples

// MultipleSummer returns a function that returns the sum of all multiples
// particular numbers up to but not including that number.
func MultipleSummer(multiples ...int) func(int) int {
	fn := func(limit int) int {
		var sum int

		for i := 1; i < limit; i++ {
			for _, multiple := range multiples {
				if i%multiple == 0 {
					sum += i
					break
				}
			}
		}

		return sum
	}

	return fn
}
