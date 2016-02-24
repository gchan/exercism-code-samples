package palindrome

import (
	"errors"
	"strconv"
)

// Product lists all the possible two-factor factorizations of the
// specified number.
type Product struct {
	Product        int
	Factorizations [][2]int
}

// InsertFactors appends the provided factors into the the list of
// Factorizations.
func (product *Product) InsertFactors(f1, f2 int) {
	product.Factorizations = append(product.Factorizations, [2]int{f1, f2})
}

// Products returns the minimum and maximum Product within the
// given limits.
func Products(minFactor, maxFactor int) (Product, Product, error) {
	if minFactor > maxFactor {
		return Product{}, Product{}, errors.New("fmin > fmax")
	}

	var maxProduct Product
	minProduct := Product{maxFactor * maxFactor, [][2]int{}}

	for f1 := minFactor; f1 <= maxFactor; f1++ {
		for f2 := f1; f2 <= maxFactor; f2++ {
			product := f1 * f2
			if Palindrome(product) {
				if product > maxProduct.Product {
					maxProduct = Product{product, [][2]int{{f1, f2}}}
				} else if product == maxProduct.Product {
					maxProduct.InsertFactors(f1, f2)
				}

				if product < minProduct.Product {
					minProduct = Product{product, [][2]int{{f1, f2}}}
				} else if product == minProduct.Product {
					minProduct.InsertFactors(f1, f2)
				}
			}
		}
	}

	if minProduct.Factorizations == nil || maxProduct.Factorizations == nil {
		return Product{}, Product{}, errors.New("No palindromes...")
	}

	return minProduct, maxProduct, nil
}

// Palindrome determines if a number reads the same both ways.
func Palindrome(number int) bool {
	str := strconv.Itoa(number)

	for i := 0; i < len(str)/2; i++ {
		if str[i] != str[len(str)-i-1] {
			return false
		}
	}

	return true
}
