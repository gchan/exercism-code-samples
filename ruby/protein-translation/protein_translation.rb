class InvalidCodonError < StandardError
end

class Translation
  MAP = {
    AUG: "Methionine",
    UUU: "Phenylalanine",
    UUC: "Phenylalanine",
    UUA: "Leucine",
    UUG: "Leucine",
    UCU: "Serine",
    UCC: "Serine",
    UCA: "Serine",
    UCG: "Serine",
    UAU: "Tyrosine",
    UAC: "Tyrosine",
    UGU: "Cysteine",
    UGC: "Cysteine",
    UGG: "Tryptophan",
    UAA: "STOP",
    UAG: "STOP",
    UGA: "STOP"
  }

  def self.of_codon(codon)
    protein = MAP[codon.to_sym]
    raise InvalidCodonError.new unless protein
    protein
  end

  def self.of_rna(rna)
    rna.chars.each_slice(3).map(&:join).
      map { |codon| self.of_codon(codon) }.
      take_while { |protein| protein != "STOP" }
  end
end
