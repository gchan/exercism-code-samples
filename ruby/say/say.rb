class Say
  NUMBERS = %w(zero one two three four five six
    seven eight nine ten eleven twelve thirteen fourteen fifteen
    sixteen seventeen eighteen nineteen)

  TENS = %w(twenty thirty forty fifty sixty seventy eighty ninety)

  def initialize(number)
    raise ArgumentError unless (0..999_999_999_999).cover?(number)
    @number = number
  end

  def in_english(number = @number)
    case number
    when 0..19
      NUMBERS[number]
    when 20..99
      tens(number)
    when 100..999
      to_english(number, 100, 'hundred')
    when 1_000..999_999
      to_english(number, 1_000, 'thousand')
    when 1_000_000..999_999_999
      to_english(number, 1_000_000, 'million')
    when 1_000_000_000..999_999_999_999
      to_english(number, 1_000_000_000, 'billion')
    end
  end

  private

  def tens(number)
    string    = TENS[number / 10 - 2]
    remainder = number % 10

    string += "-#{in_english(remainder)}" unless remainder.zero?
    string
  end

  def to_english(number, decimal, decimal_unit)
    string    = "#{in_english(number / decimal)} #{decimal_unit}"
    remainder = number % decimal

    string += " #{in_english(remainder)}" unless remainder.zero?
    string
  end
end
