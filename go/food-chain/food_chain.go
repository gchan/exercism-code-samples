package foodchain

import "fmt"

// TestVersion is the version of the test suite this code is written to.
const TestVersion = 1

var animals = []string{
	"fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse",
}

var animalDescription = []string{
	"",
	"It wriggled and jiggled and tickled inside her.\n",
	"How absurd to swallow a bird!\n",
	"Imagine that, to swallow a cat!\n",
	"What a hog, to swallow a dog!\n",
	"Just opened her throat and swallowed a goat!\n",
	"I don't know how she swallowed a cow!\n",
	"She's dead, of course!",
}

// Verse returns the specified verse of the song 'I Know an Old Lady Who Swallowed a Fly'
func Verse(verse int) string {
	animalIndex := verse - 1
	firstAnimal := animals[animalIndex]
	animalChain := animals[0 : animalIndex+1]

	lyrics := fmt.Sprintf("I know an old lady who swallowed a %s.\n", firstAnimal)
	lyrics += animalDescription[animalIndex]

	if firstAnimal == "horse" {
		return lyrics
	}

	for i := len(animalChain) - 1; i > 0; i-- {
		animal1 := animalChain[i]
		animal2 := animalChain[i-1]

		if animal2 == "spider" {
			animal2 = "spider that wriggled and jiggled and tickled inside her"
		}

		lyrics += fmt.Sprintf("She swallowed the %s to catch the %s.\n", animal1, animal2)
	}

	lyrics += "I don't know why she swallowed the fly. Perhaps she'll die."

	return lyrics
}

// Verses returns the verses between from and to of the song 'I Know an Old Lady Who Swallowed a Fly'
func Verses(from, to int) (lyrics string) {
	for i := from; i < to; i++ {
		lyrics += Verse(i)
		lyrics += "\n\n"
	}
	lyrics += Verse(to)

	return
}

// Song returns all the verses of the song 'I Know an Old Lady Who Swallowed a Fly'
func Song() string {
	return Verses(1, 8)
}
