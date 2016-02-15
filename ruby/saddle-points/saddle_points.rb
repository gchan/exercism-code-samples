class Matrix
  attr_reader :rows, :columns

  def initialize(string)
    @rows    = string.split("\n").map { |row| row.split.map(&:to_i) }
    @columns = @rows.transpose
  end

  def saddle_points
    results = []

    rows.each_with_index do |row, r|
      row.each_with_index do |value, c|
        if value == row.max && value <= columns[c].min
          results << [r, c]
        end
      end
    end

    results
  end
end
