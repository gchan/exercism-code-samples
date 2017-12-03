class Change
  def self.generate(coins, target)
    return -1 if target < 0

    best = Array.new
    best[0] = []

    coins.sort.reverse.uniq.each do |coin|
      (coin..target).each do |subtarget|
        best_without = best[subtarget - coin]

        next if best_without.nil? ||
          best[subtarget] &&
          best[subtarget].size <= best_without.size + 1

        best[subtarget] = [coin] + best_without
      end
    end

    best[target] || -1
  end
end

module BookKeeping
  VERSION = 2
end
