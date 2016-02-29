class PigLatin
  def self.translate(text)
    new(text).translate
  end

  def initialize(text)
    @text = text
  end

  def translate
    @text.
      split.
      map { |word| convert_word(word) }.
      join(" ")
  end

  private

  def convert_word(word)
    if word.match /\A([aeiou]|y[^aeiou]|xr)/
      word + "ay"
    else
      consonant, rest = word.scan(/\A([^aeiou]?qu|[^aeiou]+)(.*)/).first
      rest + consonant + "ay"
    end
  end
end
