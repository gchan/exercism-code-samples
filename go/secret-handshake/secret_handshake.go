package secret

// Handshake converts a decimal number into a sequence of events for a secret handshake
func Handshake(num int) (handshake []string) {
	if num < 1 {
		return
	}

	actions := []string{"wink", "double blink", "close your eyes", "jump"}

	for i, action := range actions {
		mask := 1 << uint(i)
		if num&mask != 0 {
			handshake = append(handshake, action)
		}
	}

	if num&16 == 16 {
		length := len(handshake)
		for i := 0; i < length/2; i++ {
			handshake[i], handshake[length-i-1] = handshake[length-i-1], handshake[i]
		}
	}

	return
}
