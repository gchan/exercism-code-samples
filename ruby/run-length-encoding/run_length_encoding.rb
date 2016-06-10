class RunLengthEncoding
  def self.encode(string)
    string.chars.chunk { |c| c }.inject("") do |str, (char, seq)|
      if seq.length > 1
        str << seq.length.to_s + char
      else
        str << char
      end
    end
  end

  def self.decode(string)
    string.scan(/(\d+)?(.)/).inject("") do |str, (count, char)|
      times = count ? count.to_i : 1
      str << char * times
    end
  end
end

module BookKeeping
  VERSION = 2
end
