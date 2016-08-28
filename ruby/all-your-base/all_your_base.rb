class BaseConverter
  def self.convert(input_base, digits, output_base)
    return nil if input_base < 2 || output_base < 2
    return nil if digits.any?(&:negative?)
    return nil if digits.any? { |digit| digit >= input_base }
    return [] if digits.empty?
    return [0] if digits.all?(&:zero?)

    base_10 = digits.reverse.map.
      with_index { |digit, i| digit * input_base ** i }.
      inject(:+)

    result = []

    while base_10.positive?
      result << base_10 % output_base
      base_10 /= output_base
    end

    result.reverse
  end
end

class BookKeeping
  VERSION = 1
end
