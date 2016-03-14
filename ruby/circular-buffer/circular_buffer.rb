class CircularBuffer
  BufferEmptyException = Class.new(StandardError)
  BufferFullException  = Class.new(StandardError)

  attr_reader :buffer, :size

  def initialize(size)
    clear(size)
  end

  def write(item)
    return if item.nil?
    raise BufferFullException unless buffer[@write].nil?
    write_buffer(item)
  end

  def write!(item)
    return if item.nil?
    next_read unless buffer[@write].nil?
    write_buffer(item)
  end

  def write_buffer(item)
    buffer[@write] = item
    next_write
  end

  def read
    raise BufferEmptyException if buffer.compact.empty?
    item = buffer[@read]

    buffer[@read] = nil
    next_read

    item
  end

  def clear(size = buffer.size)
    @buffer = Array.new(size)
    @size   = size
    @write  = 0
    @read   = 0
  end

  private

  def next_read
    @read = ((@read + 1) % size)
  end

  def next_write
    @write = ((@write + 1) % size)
  end
end
