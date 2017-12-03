module CollatzConjecture
  def self.steps(n)
    raise ArgumentError if n < 1
    steps = 0

    until n == 1
      if n.odd?
        n = n * 3 + 1
      else
        n /= 2
      end
      steps += 1
    end

    steps
  end
end

module BookKeeping
  VERSION = 1
end
