class PhoneNumber
  BAD_NUMBER = '0000000000'

  attr_reader :number

  def initialize(number)
    @number = clean(number) || BAD_NUMBER
  end

  def area_code
    number[0, 3]
  end

  def to_s
    "(#{number[0, 3]}) #{number[3, 3]}-#{number[6, 4]}"
  end

  private

  def clean(number)
    number.gsub(/\W/, '')[/^1?(\d{10})\z/, 1]
  end
end
