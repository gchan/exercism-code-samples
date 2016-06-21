package bob

import (
	"regexp"
	"strings"
)

// TestVersion is the version of the test suite this code is written to.
const testVersion = 2

// Hey responds with a lackadaisical statement depending on the input.
func Hey(input string) string {
	shout := regexp.MustCompile("\\p{Lu}")
	question := regexp.MustCompile("\\?\\z")

	switch input = strings.TrimSpace(input); {
	case strings.ToUpper(input) == input && shout.MatchString(input):
		return "Whoa, chill out!"
	case question.MatchString(input):
		return "Sure."
	case input == "":
		return "Fine. Be that way!"
	default:
		return "Whatever."
	}
}
