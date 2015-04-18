class Binary
  attr_reader :binary

  def initialize(binary)
    @binary = binary
  end

  def to_decimal
    return 0 unless binary =~ /\A[0-1]+\z/

    decimal = 0

    binary.chars.reverse.each_with_index do |bit, idx|
      decimal += 2**idx if bit == '1'
    end

    decimal
  end
end
