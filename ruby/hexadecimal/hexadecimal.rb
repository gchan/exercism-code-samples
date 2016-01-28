class Hexadecimal
  HEX_TO_VALUE = {
    '0' => 0,  '1' => 1,  '2' => 2,
    '3' => 3,  '4' => 4,  '5' => 5,
    '6' => 6,  '7' => 7,  '8' => 8,
    '9' => 9,  'a' => 10, 'b' => 11,
    'c' => 12, 'd' => 13, 'e' => 14,
    'f' => 15
  }.freeze

  attr_reader :hex

  def initialize(hex)
    @hex = (hex =~ /\A[\h]*\Z/) ? hex.downcase : ""
  end

  def to_decimal
    hex.chars.map(&HEX_TO_VALUE).
      inject(0) { |sum, value| sum * 16 + value }
  end
end
