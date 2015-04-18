class Grains
  def square(squares)
    1 << squares - 1
  end

  def total
    (1 << 64) - 1
  end
end
