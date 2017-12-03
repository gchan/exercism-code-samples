class ComplexNumber
  attr_accessor :a, :b

  def initialize(a, b)
    @a = a
    @b = b
  end

  def abs
    Math.sqrt(a ** 2 + b ** 2)
  end

  def conjugate
    ComplexNumber.new(a, -b)
  end

  def real
    a
  end

  def imaginary
    b
  end

  def +(other)
    ComplexNumber.new(a + other.a, b + other.b)
  end

  def -(other)
    ComplexNumber.new(a - other.a, b - other.b)
  end

  def *(other)
    # (a + bi) * (c + di) = (ac - bd) + (bc + ad)i
    ComplexNumber.new(
      a * other.a - b * other.b,
      b * other.a + a * other.b
    )
  end

  def /(other)
    # (a + bi) / (c + di) =
    # (ac + bd) / (cc + dd) + (bc - ad) / (cc + dd)i
    denominator = other.a ** 2 + other.b ** 2

    ComplexNumber.new(
      (a * other.a + b * other.b) / denominator.to_f,
      (b * other.a - a * other.b) / denominator.to_f
    )
  end

  def exp
    ComplexNumber.new(
      Math.exp(a) * (Math.cos(b) + Math.sin(b)).round,
      0
    )
  end

  def ==(other)
    a == other.a && b = other.b
  end
end

module BookKeeping
  VERSION = 1
end
