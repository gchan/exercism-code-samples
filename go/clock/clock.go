package clock

import (
	"fmt"
)

// TestVersion is the version of the test suite this code is written to.
const TestVersion = 2

// Clock handles the time without dates.
type Clock int16

// Time returns a Clock for the provided values.
func Time(hour, minute int) Clock {
	minutes := (minute + hour*60) % 1440
	if minutes < 0 {
		minutes = minutes + 1440
	}

	return Clock(minutes)
}

// String returns the time formatted in hh:mm format.
func (clock Clock) String() string {
	return fmt.Sprintf("%02d:%02d", clock/60, clock%60)
}

// Add returns a Clock with the provided minutes added.
func (clock Clock) Add(minutes int) Clock {
	return Time(0, int(clock)+minutes)
}
