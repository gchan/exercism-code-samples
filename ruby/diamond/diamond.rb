class Diamond
  def self.make_diamond(target)
    rows = []
    width = target.hex - "A".hex

    ("A"..target).each_with_index do |letter, length|
      row = " " * (width - length)
      row += letter
      row += " " * (length)
      row += row[0..-2].reverse + "\n"

      rows << row
    end

    rows << rows[0..-2].reverse

    rows.join
  end
end

class Bookkeeping
  VERSION = 1
end
