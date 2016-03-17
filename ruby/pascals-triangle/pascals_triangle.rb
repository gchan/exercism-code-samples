class Triangle
  def initialize(height)
    @height = height
  end

  def rows
    rows = [[1]]

    (@height - 1).times do
      row = []
      last_row = rows.last

      (last_row.length - 1).times do |i|
        row << last_row[i] + last_row[i+1]
      end

      row.unshift(last_row.first)
      row << last_row.last

      rows << row
    end

    rows
  end
end
