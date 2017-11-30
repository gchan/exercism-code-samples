require 'set'

# DFS solution, not memory efficient
class Dominoes
  def self.chain(dominoes)
    return dominoes if dominoes.empty?

    if dominoes.size == 1
      return dominoes if dominoes.first.first == dominoes.first.last
      return nil
    end

    dominoes = dominoes.map(&:sort)

    visited = Set.new
    solution = [dominoes.shift]

    until solution.empty?
      return solution if dominoes.empty?

      visited.add([solution, dominoes])

      domino = dominoes.shift

      if domino.first == solution.last.last
        solution << domino
      elsif domino.last == solution.last.last
        solution << domino.reverse
      else
        dominoes << domino
        dominoes << solution.pop.sort if visited.include?([solution, dominoes])
      end
    end

    nil
  end
end

module BookKeeping
  VERSION = 1
end
