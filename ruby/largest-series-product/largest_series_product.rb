class Series
  VERSION = 1
  attr_reader :series

  def initialize(series)
    raise ArgumentError unless series =~ /\A\d*\z/
    @series = series.chars.map(&:to_i)
  end

  def largest_product(length)
    return 1 if length.zero?
    raise ArgumentError if length > series.length || length < 0

    series.each_cons(length).
      map { |*digits| digits.flatten.inject(:*) }.
      max
  end
end
