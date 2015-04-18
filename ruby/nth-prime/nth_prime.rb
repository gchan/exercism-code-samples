class Prime
  attr_reader :primes

  def nth(n)
    raise ArgumentError.new('N must be positive') if n < 1

    primes ||= [2, 3]
    candidate = primes.last

    while n > primes.length
      candidate += 2

      unless primes.any? { |prime| candidate % prime == 0 }
        primes.push(candidate)
      end
    end

    primes[n - 1]
  end
end
