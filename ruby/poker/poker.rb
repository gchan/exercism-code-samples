class Poker
  def initialize(hands)
    @hands = hands.map { |hand| Hand.new(hand) }.sort
  end

  def best_hand
    best = @hands.last
    @hands.select { |hand| best == hand }.map(&:hand)
  end
end

class Hand
  CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  include Comparable

  attr_reader :hand

  def initialize(hand)
    @hand = hand
  end

  def <=>(other)
    poker_rank <=> other.poker_rank
  end

  protected

  def poker_rank
    [straight_flush, square, full, flush, straight, three, two_pair, pair, high_card]
  end

  def numbers
    hand.map(&:chars).map(&:first).map { |card| CARDS.index(card) }.sort
  end

  def suits
    hand.map(&:chars).map(&:last)
  end

  def get_counts
    numbers.each_with_object(Hash.new(0)) do |card, counts|
      counts[card] += 1
    end
  end

  def high_card
    numbers.last
  end

  def pair
    get_counts.select { |_, v| v > 1 }.keys.sort.last || -1
  end

  def two_pair
    counts = get_counts.select { |_, v| v > 1 }
    if counts.keys.count > 1
      counts.keys.sort.reverse
    else
      []
    end
  end

  def three
    get_counts.select! { |_, v| v == 3 }.first || []
  end

  def straight
    nums = numbers.uniq
    if nums.count == 5 && nums[4] - nums[0] == 4
      nums[-1]
    elsif nums.count == 5 && ace_low_straight
      CARDS.index('4')
    else
      -1
    end
  end

  def ace_low_straight
    numbers.uniq.count == 5 && numbers == [0, 1, 2, 3, 12]
  end

  def flush
    suits.uniq.one? ? 1 : -1
  end

  def full
    if get_counts.values.sort == [2, 3]
      get_counts.select { |_, v| v == 3 }.keys.first
    else
      -1
    end
  end

  def square
    get_counts.select { |_, v| v == 4 }.keys.first || -1
  end

  def straight_flush
    if straight > -1 && flush > -1
      straight
    else
      -1
    end
  end
end

module BookKeeping
  VERSION = 1
end