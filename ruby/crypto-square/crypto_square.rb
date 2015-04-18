class Crypto
  attr_reader :plaintext

  def initialize(plaintext)
    @plaintext = plaintext.gsub(/\W/, '').downcase
  end

  def normalize_plaintext
    plaintext
  end

  def plaintext_segments
    plaintext.chars.each_slice(size).to_a.map(&:join)
  end

  def size
    return 2 if plaintext.size <= 3

    (plaintext.size**0.5).ceil
  end

  def rows
    (ciphertext.size / size.to_f).ceil
  end

  def ciphertext
    plaintext.chars.each_slice(size).to_a
      .inject(&:zip).flatten.join
  end

  def normalize_ciphertext
    ciphertext.chars.each_slice(rows).to_a
      .map(&:join).join(' ')
  end
end
