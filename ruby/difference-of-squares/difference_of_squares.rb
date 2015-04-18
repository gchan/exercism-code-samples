class Squares
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def square_of_sums
    sum = (1 + number) * number / 2
    sum**2
  end

  def sum_of_squares
    1.upto(number).reduce(0) do |sum, number|
      sum + number**2
    end
  end

  def difference
    square_of_sums - sum_of_squares
  end
end
