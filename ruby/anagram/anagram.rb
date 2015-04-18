class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    sorted_chars = @word.downcase.chars.sort

    words.select do |candidate|
      candidate.downcase != @word.downcase &&
        candidate.downcase.chars.sort == sorted_chars
    end
  end
end
