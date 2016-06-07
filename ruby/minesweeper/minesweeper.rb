ValueError = Class.new(StandardError)

class Board
  attr_reader :input

  def self.transform(input)
    new(input).transform
  end

  def initialize(input)
    @input = input
  end

  def transform
    raise ValueError unless valid_input?(input)

    rows = input.length - 2
    cols = input[0].length - 2

    (1..rows).each do |row|
      (1..cols).each do |col|
        next if input[row][col] == "*"
        count = count_mines(row, col)
        input[row][col] = count.to_s if count > 0
      end
    end

    input
  end

  private

  def count_mines(row, col)
    count = 0

    ((row-1)..(row+1)).each do |r|
      ((col-1)..(col+1)).each do |c|
        next if r == row && c == col
        count += 1 if input[r][c] == "*"
      end
    end

    count
  end

  def valid_input?(input)
    input.map(&:length).uniq.one? &&
      input[0] =~ /\A\+-*\+\z/ &&
      input[-1] =~ /\A\+-*\+\z/ &&
      input[1..-2].all? { |row| row =~ /\A\|( |\*)*\|\z/}
  end
end
