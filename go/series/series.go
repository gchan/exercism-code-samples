package slice

// All returns a list of all substrings of s with length n.
func All(n int, s string) (substrings []string) {
	for i := 0; i <= len(s)-n; i++ {
		substrings = append(substrings, s[i:i+n])
	}
	return
}

// Frist returns the first substring of s with length n.
func Frist(n int, s string) string {
	return s[:n]
}

// First returns the first substring of s with length n.
func First(n int, s string) (first string, ok bool) {
	if n > len(s) {
		return "", false
	}

	return s[:n], true
}
