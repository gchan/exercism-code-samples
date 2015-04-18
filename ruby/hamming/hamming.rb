class Hamming
  def self.compute(dna_a, dna_b)
    a = dna_a.chars
    b = dna_b.chars

    a.zip(b).count { |n1, n2| n1 != n2 }
  end
end
