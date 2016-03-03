class Luhn
  attr_reader :numbers

  def self.create(number)
    sum = Luhn.new(number * 10).checksum
    check_digit = sum * 9 % 10

    "#{number}#{check_digit}".to_i
  end

  def initialize(number)
    @numbers = number.to_s.chars.map(&:to_i)
  end

  def valid?
    checksum % 10 == 0
  end

  def checksum
    addends.inject(:+)
  end

  def addends
    numbers.map.with_index do |digit, index|
      if (numbers.length - index).even?
        double = digit * 2
        double / 10 + double % 10
      else
        digit
      end
    end
  end
end
