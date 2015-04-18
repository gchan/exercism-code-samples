class Integer
  ROMAN_NUMERAL_MAP = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  def to_roman
    remainder = self

    ROMAN_NUMERAL_MAP.each.inject('') do |string, (divisor, letters)|
      quotient = remainder / divisor
      remainder %= divisor
      string << letters * quotient
    end
  end
end
