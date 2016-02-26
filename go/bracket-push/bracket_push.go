package brackets

const testVersion = 3

// Bracket determines if the brackets and braces are matched correctly,
// and nested correctly.
func Bracket(brackets string) (bool, error) {
	stk := []rune{}
	translate := map[rune]rune{
		'(': ')',
		'{': '}',
		'[': ']',
	}

	for _, char := range brackets {
		if translate[char] != 0 {
			stk = append(stk, char)
		} else {
			if len(stk) == 0 {
				return false, nil
			}
			var openingChar rune
			openingChar, stk = stk[len(stk)-1], stk[:len(stk)-1]

			if translate[openingChar] != char {
				return false, nil
			}
		}
	}

	return len(stk) == 0, nil
}
