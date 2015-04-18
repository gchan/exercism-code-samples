class Trinary
  attr_reader :trinary

  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    return 0 unless trinary =~ /\A[0-2]+\z/

    decimal = 0

    trinary.chars.reverse.each_with_index do |tri, idx|
      decimal += tri.to_i * 3**idx
    end

    decimal
  end
end
