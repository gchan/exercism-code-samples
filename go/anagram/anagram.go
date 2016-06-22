package anagram

import (
	"sort"
	"strings"
)

// Detect returns a subset of candidates that are anagrams of subject.
func Detect(subject string, candidates []string) (result []string) {
	sortedChars := func(input string) string {
		input = strings.ToLower(input)
		chars := strings.Split(input, "")
		sort.Strings(chars)
		return strings.Join(chars, "")
	}

	sortedSubject := sortedChars(subject)

	for _, candidate := range candidates {
		candidate = strings.ToLower(candidate)
		sorted := sortedChars(candidate)

		if sortedSubject == sorted && subject != candidate {
			result = append(result, candidate)
		}
	}

	return
}
