class Isogram
  def self.isogram?(string)
    letters = string.downcase.gsub(/[^a-z]/, '').chars
    letters.uniq == letters
  end
end

module BookKeeping
  VERSION = 4
end
