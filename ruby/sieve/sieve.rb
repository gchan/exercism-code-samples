class Sieve
  attr_reader :primes

  def initialize(limit)
    @primes = generate_primes(limit)
  end

  private

  def generate_primes(limit)
    candidates = (2..limit).to_a

    primes = []

    while candidates.any?
      prime = candidates.shift
      primes << prime

      candidates.reject! { |candidate| candidate % prime == 0 }
    end

    primes
  end
end
