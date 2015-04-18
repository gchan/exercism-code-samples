class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    count = Hash.new(0)

    @phrase.downcase.split(/[^\w']+/).each do |word|
      count[word] += 1
    end

    count
  end
end
