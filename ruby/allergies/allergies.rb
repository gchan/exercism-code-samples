class Allergies
  ITEMS = %w(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)

  attr_reader :score

  def initialize(score)
    @score = score
  end

  def allergic_to?(item)
    list.include?(item)
  end

  def list
    ITEMS.select.with_index do |item, index|
      score & 2**index > 0
    end
  end
end
