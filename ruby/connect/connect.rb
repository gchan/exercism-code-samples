class Board
  attr_reader :board, :rows, :cols

  def initialize(input)
    @board = input.map(&:strip).map(&:split)
    @rows  = board.length
    @cols  = board.first.length
  end

  def winner
    winner?("X") || winner?("O") || ""
  end

  private

  # Depth-first search
  def winner?(player)
    if player == "X"
      neighbours =
        rows.times.map { |r| [r, 0] }.
          select { |r, q| board[r][q] == "X" }
    else
      neighbours =
        cols.times.map { |c| [0, c] }.
          select { |r, q| board[r][q] == "O" }
    end

    visited = []

    while neighbours.any?
      hex = neighbours.pop
      visited << hex

      neighbours(hex[0], hex[1]).each do |r, q|
        if board[r][q] == player
          return player if winning_hex?(player, r, q)
          neighbours << [r, q] unless visited.include?([r, q])
        end
      end
    end
  end

  def neighbours(r, q)
    [-1, 0, 1].permutation(2).
      map { |dr, dq| [r + dr, q + dq] }.
      select { |r, q| r >= 0 && r < rows && q >= 0 && q < cols }
  end

  def winning_hex?(player, r, q)
    player == "X" && q == cols - 1 ||
      player == "O" && r == rows - 1
  end
end

class BookKeeping
  VERSION = 1
end
