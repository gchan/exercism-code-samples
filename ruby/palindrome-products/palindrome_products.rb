require 'set'

class Palindromes
  Solution = Struct.new(:value, :factors)

  attr_reader :range, :largest, :smallest

  def initialize(max_factor:, min_factor: 0)
    @range = (min_factor..max_factor)
  end

  def generate
    products = Hash.new { |k,v| k[v] = Set.new }

    range.each do |factor_one|
      range.each do |factor_two|
        product = factor_one * factor_two
        if palindrome?(product)
          products[product] << [factor_one, factor_two].sort
        end
      end
    end

    largest = products.keys.max
    @largest = Solution.new(largest, products[largest].to_a)

    smallest = products.keys.min
    @smallest = Solution.new(smallest, products[smallest].to_a)
  end

  private

  def palindrome?(number)
    number.to_s.reverse.to_i == number
  end
end
