package etl

import "strings"

// Transform transforms scrabble scoring data into a better format.
func Transform(oldData map[int][]string) map[string]int {
	newData := make(map[string]int)

	for value, letters := range oldData {
		for _, letter := range letters {
			newData[strings.ToLower(letter)] = value
		}
	}

	return newData
}
