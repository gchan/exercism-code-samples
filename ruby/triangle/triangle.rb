TriangleError = Class.new(StandardError)

class Triangle
  attr_reader :sides

  def initialize(*sides)
    @sides = sides.sort
  end

  def kind
    a, b, c = sides

    raise TriangleError if a <= 0 || a + b <= c

    if sides.uniq.size == 1
      :equilateral
    elsif sides.uniq.size == 2
      :isosceles
    else
      :scalene
    end
  end
end
