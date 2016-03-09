class Triplet
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    a*a+b*b == c*c
  end

  def self.where(min_factor: 1, max_factor:, sum: nil)
    triplets = []

    (min_factor..max_factor).each do |a|
      (a..max_factor).each do |b|
        c = Math.sqrt(a*a + b*b)

        next unless c <= max_factor && c.round == c

        triplet = Triplet.new(a, b, c)
        if triplet.pythagorean? && (!sum || triplet.sum == sum)
          triplets << triplet
        end
      end
    end

    triplets
  end
end
