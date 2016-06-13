package allergies

import "math"

var allergens = []string{"eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"}

func Allergies(score int) (result []string) {
	for i, allergen := range allergens {
		if int(math.Pow(2, float64(i)))&score >= 1 {
			result = append(result, allergen)
		}
	}

	return
}

func AllergicTo(score int, allergen string) bool {
	for i, item := range allergens {
		if item == allergen && int(math.Pow(2, float64(i)))&score >= 1 {
			return true
		}
	}
	return false
}
