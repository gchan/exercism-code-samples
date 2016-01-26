package house

// Embed embeds a noun phrase as the object of relative clause with a
// transitive verb.
func Embed(relPhrase, nounPhrase string) string {
	return relPhrase + " " + nounPhrase
}

// Verse generates a verse of a song with relative clauses that have
// a recursive structure.
func Verse(subject string, relPhrases []string, nounPhrase string) string {
	if len(relPhrases) == 0 {
		return Embed(subject, nounPhrase)
	}

	last = len(relPhrases) - 1
	nounPhrase = Embed(relPhrases[last], nounPhrase)

	return Verse(subject, relPhrases[:last], nounPhrase)
}

// Song generates the full text of "The House That Jack Built"
func Song() (song string) {
	subject := "This is"
	nounPhrase := "the house that Jack built."

	relPhrases := []string{
		"the horse and the hound and the horn\nthat belonged to",
		"the farmer sowing his corn\nthat kept",
		"the rooster that crowed in the morn\nthat woke",
		"the priest all shaven and shorn\nthat married",
		"the man all tattered and torn\nthat kissed",
		"the maiden all forlorn\nthat milked",
		"the cow with the crumpled horn\nthat tossed",
		"the dog\nthat worried",
		"the cat\nthat killed",
		"the rat\nthat ate",
		"the malt\nthat lay in",
	}

	song += Verse(subject, []string{}, nounPhrase)

	for verse := len(relPhrases) - 1; verse >= 0; verse-- {
		song += "\n\n" + Verse(subject, relPhrases[verse:], nounPhrase)
	}

	return
}
