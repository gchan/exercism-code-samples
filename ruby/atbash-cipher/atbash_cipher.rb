class Atbash
  def self.encode(plaintext)
    alphabet = ('a'..'z').to_a.join

    plaintext.downcase.
      gsub(/[^a-z0-9]/, '').
      tr(alphabet, alphabet.reverse).
      scan(/.{1,5}/).
      join(" ")
  end
end
