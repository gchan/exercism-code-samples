package gigasecond

import (
	"time"
)

// TestVersion is the version of the test suite this code is written to.
const TestVersion = 2

// AddGigasecond adds 1,000,000,000 seconds to the provided Time.
func AddGigasecond(t time.Time) time.Time {
	return t.Add(1e9 * time.Second)
}

// Birthday is Alan Turing's birthday.
var Birthday, _ = time.Parse("02/01/2006", "23/06/1912")
