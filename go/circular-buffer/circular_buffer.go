package circular

import "errors"

const testVersion = 3

type Buffer struct {
	read   int
	write  int
	array  []byte
	length int
}

func NewBuffer(size int) *Buffer {
	return &Buffer{array: make([]byte, size)}
}

func (buffer *Buffer) ReadByte() (byte, error) {
	if buffer.length == 0 {
		return 0, errors.New("Buffer is empty")
	}
	result := buffer.array[buffer.read]
	buffer.nextRead()
	buffer.length--
	return result, nil
}

func (buffer *Buffer) WriteByte(c byte) error {
	if buffer.full() {
		return errors.New("Buffer is full")
	}
	buffer.array[buffer.write] = c
	buffer.nextWrite()
	buffer.length++
	return nil
}

func (buffer *Buffer) Overwrite(c byte) {
	if buffer.full() {
		buffer.nextRead()
	} else {
		buffer.length++
	}
	buffer.array[buffer.write] = c
	buffer.nextWrite()
}

func (buffer *Buffer) Reset() {
	buffer.read = 0
	buffer.write = 0
	buffer.length = 0
}

func (buffer *Buffer) full() bool {
	return buffer.length >= len(buffer.array)
}

func (buffer *Buffer) nextRead() {
	buffer.read = (buffer.read + 1) % len(buffer.array)
}

func (buffer *Buffer) nextWrite() {
	buffer.write = (buffer.write + 1) % len(buffer.array)
}
