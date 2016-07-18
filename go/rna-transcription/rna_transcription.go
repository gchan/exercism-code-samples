package strand

import "strings"

const testVersion = 3

func ToRNA(dna string) string {
	translation := map[string]string{
		"G": "C",
		"C": "G",
		"T": "A",
		"A": "U",
	}

	result := ""

	for _, nucleotide := range strings.Split(dna, "") {
		result = result + translation[nucleotide]
	}

	return result
}
