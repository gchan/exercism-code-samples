package wordcount

import (
	"regexp"
	"strings"
)

const testVersion = 2

type Frequency map[string]int

func WordCount(phrase string) Frequency {
	result := Frequency{}

	phrase = regexp.MustCompile("\\W").ReplaceAllString(phrase, " ")
	phrase = regexp.MustCompile("\\s+").ReplaceAllString(phrase, " ")
	phrase = strings.ToLower(phrase)
	phrase = strings.TrimSpace(phrase)

	for _, word := range strings.Split(phrase, " ") {
		if _, ok := result[word]; ok {
			result[word]++
		} else {
			result[word] = 1
		}
	}

	return result
}
