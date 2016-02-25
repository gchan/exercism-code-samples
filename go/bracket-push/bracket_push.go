package brackets

const testVersion = 3

// Bracket determines if the brackets and braces are matched correctly,
// and nested correctly.
func Bracket(brackets string) (bool, error) {
	stk := []rune{}
	translate := map[rune]rune{
		')': '(',
		'}': '{',
		']': '[',
	}

	for _, char := range brackets {
		if char == '(' || char == '[' || char == '{' {
			stk = append(stk, char)
		} else {
			if len(stk) == 0 {
				return false, nil
			}
			var closingChar rune
			closingChar, stk = stk[len(stk)-1], stk[:len(stk)-1]

			if closingChar != translate[char] {
				return false, nil
			}
		}
	}

	return len(stk) == 0, nil
}
