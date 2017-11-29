class Transpose
  def self.transpose(input)
    chars = input.split("\n").map(&:chars)

    width = chars.map(&:size).max

    chars
      .map { |row| row.join.ljust(width).chars }
      .transpose
      .map(&:join)
      .join("\n").strip
  end
end

module BookKeeping
  VERSION = 1
end
