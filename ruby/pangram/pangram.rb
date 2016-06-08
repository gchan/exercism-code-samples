require 'set'

class Pangram
  ALPHABET = ('a'..'z').to_set

  def self.is_pangram?(string)
    ALPHABET.subset?(string.downcase.chars.to_set)
  end
end

module BookKeeping
  VERSION = 2
end
