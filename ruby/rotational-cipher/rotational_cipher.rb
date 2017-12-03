module RotationalCipher
  def self.rotate(input, rotate)
    from = ('a'..'z').to_a
    to   = from.rotate(rotate)

    input
      .tr(from.join, to.join)
      .tr(from.join.upcase, to.join.upcase)
  end
end

module BookKeeping
  VERSION = 1
end
