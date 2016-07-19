package romannumerals

import "errors"

const testVersion = 2

type arabicToRoman struct {
	arabic int
	roman  string
}

func ToRomanNumeral(arabic int) (string, error) {
	translation := []arabicToRoman{
		{1000, "M"},
		{900, "CM"},
		{500, "D"},
		{400, "CD"},
		{100, "C"},
		{90, "XC"},
		{50, "L"},
		{40, "XL"},
		{10, "X"},
		{9, "IX"},
		{5, "V"},
		{4, "IV"},
		{1, "I"},
	}

	if arabic <= 0 || arabic >= 4000 {
		return "", errors.New("Out of range")
	}

	result := ""
	remainder := arabic

	for _, t := range translation {
		quotient := remainder / t.arabic
		remainder = remainder % t.arabic
		for i := 0; i < quotient; i++ {
			result = result + t.roman
		}
	}

	return result, nil
}
