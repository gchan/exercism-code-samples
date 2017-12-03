package robotname

import (
	"crypto/rand"
	"math/big"
)

type Robot struct {
	name string
}

func (robot *Robot) Name() string {
	if robot.name == "" {
		robot.name = robot.generateName()
	}
	return robot.name
}

func (robot *Robot) Reset() string {
	robot.name = robot.generateName()
	return robot.name
}

func (robot *Robot) generateName() string {
	bytes := make([]byte, 5)

	for i := 0; i < 3; i++ {
		bytes[i] = byte(secureRandom(26) + 65)
	}
	for i := 2; i < 5; i++ {
		bytes[i] = byte(secureRandom(10) + 48)
	}

	return string(bytes)
}

func secureRandom(max int64) int64 {
	val, _ := rand.Int(rand.Reader, big.NewInt(max))
	return val.Int64()
}
