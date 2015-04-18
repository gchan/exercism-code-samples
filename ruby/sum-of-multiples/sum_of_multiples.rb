class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(up_to)
    sum = 0

    (1..(up_to - 1)).each do |i|
      sum += i if multiple?(i)
    end

    sum
  end

  def self.to(up_to)
    new(3, 5).to(up_to)
  end

  private

  def multiple?(i)
    multiples.any? do |multiple|
      i % multiple == 0
    end
  end
end
