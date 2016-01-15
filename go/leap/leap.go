package leap

// TestVersion is the version of the test suite this code is written to.
const TestVersion = 1

// IsLeapYear determines whether the provided year is a leap year.
func IsLeapYear(year int) bool {
	return (year%4 == 0) && (year%100 != 0) || (year%400 == 0)
}
