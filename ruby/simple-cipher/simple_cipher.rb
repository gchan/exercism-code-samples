class Cipher
  attr_reader :key

  A_ORD = 'a'.ord

  def initialize(key = nil)
    if key.nil?
      key = ""
      100.times { key << (Random.rand(0...26) + A_ORD).chr }
    end

    raise ArgumentError unless key =~ /\A[a-z]+\z/
    @key = key
  end

  def encode(str)
    process(str, 1)
  end

  def decode(str)
    process(str, -1)
  end

  private

  def process(str, direction)
    str.chars.
      map.with_index { |c, idx| convert(c, idx, direction) }.
      join
  end

  def convert(char, index, direction)
    shift = shift(index) * direction

    ((char.ord - A_ORD + shift) % 26 + A_ORD).chr
  end

  def shift(index)
    key[index].ord - A_ORD
  end
end
