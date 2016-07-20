package say

var numbers = []string{"zero", "one", "two", "three", "four", "five", "six",
	"seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
	"sixteen", "seventeen", "eighteen", "nineteen"}

var tens = []string{"twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"}

func Say(input uint64) string {
	switch {
	case input < 20:
		return numbers[input]
	case input < 100:
		quotient, remainder := divmod(input, 10)
		result := tens[quotient-2]
		if remainder > 0 {
			result = result + "-" + Say(remainder)
		}
		return result
	case input < 1e3:
		return inEnglish(input, 1e2, "hundred")
	case input < 1e6:
		return inEnglish(input, 1e3, "thousand")
	case input < 1e9:
		return inEnglish(input, 1e6, "million")
	case input < 1e12:
		return inEnglish(input, 1e9, "billion")
	case input < 1e15:
		return inEnglish(input, 1e12, "trillion")
	case input < 1e18:
		return inEnglish(input, 1e15, "quadrillion")
	default:
		return inEnglish(input, 1e18, "quintillion")
	}
}

func inEnglish(number uint64, decimal uint64, decimalUnit string) string {
	quotient, remainder := divmod(number, decimal)
	result := Say(quotient) + " " + decimalUnit
	if remainder > 0 {
		result = result + " " + Say(remainder)
	}
	return result
}

func divmod(dividend uint64, divisor uint64) (uint64, uint64) {
	quotient := dividend / divisor
	remainder := dividend % divisor
	return quotient, remainder
}
