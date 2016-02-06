package letter

// ConcurrentFrequency counts the frequency of letters in texts using
// parallel computation
func ConcurrentFrequency(strs []string) FreqMap {
	freqMap := FreqMap{}
	frequencies := make(chan FreqMap, len(strs))

	for _, str := range strs {
		go func(s string) {
			frequencies <- Frequency(s)
		}(str)
	}

	for range strs {
		for letter, count := range <-frequencies {
			freqMap[letter] += count
		}
	}

	return freqMap
}
