class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0

    sum = divisors(number).reduce(:+)

    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    else
      'deficient'
    end
  end

  private

  def self.divisors(number)
    (1..(number/2)).select do |divisor|
      number % divisor == 0
    end
  end
end

module BookKeeping
  VERSION = 1
end
