class Nucleotide
  attr_reader :dna

  def initialize(dna)
    raise ArgumentError unless dna.match(/\A[ATGC]*\z/)
    @dna = dna
  end

  def count(nucleotide)
    dna.count(nucleotide)
  end

  def histogram
    %w(A T C G).each_with_object({}) do |nucleotide, result|
      result[nucleotide] = count(nucleotide)
    end
  end

  def self.from_dna(dna)
    new(dna)
  end
end
