require 'prime'

class PrimeFactors
  def self.for(number)
    factors = []

    while number > 1
      Prime.each do |prime|
        if number % prime == 0
          factors << prime
          number /= prime
          break
        end
      end
    end

    factors
  end
end
