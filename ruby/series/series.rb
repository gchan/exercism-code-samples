class Series
  def initialize(digits)
    @digits = digits.chars.map(&:to_i)
  end

  def slices(size)
    if size > @digits.size
      raise ArgumentError.new("Slice size is larger than #{@digits.size}")
    end

    @digits.each_cons(size).to_a
  end
end
