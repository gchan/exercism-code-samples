class ListOps
  def self.arrays(array)
    count = 0
    each(array) do
      count += 1
    end
    count
  end

  def self.reverser(array)
    result = []
    idx = arrays(array) - 1

    while idx >= 0
      result << array[idx]
      idx -= 1
    end
    result
  end

  def self.concatter(array, other)
    each(other) do |el|
      array << el
    end
    array
  end

  def self.mapper(array, &block)
    result = []
    each(array) do |el|
      result << block.call(el)
    end
    result
  end

  def self.filterer(array, &block)
    result = []
    each(array) do |el|
      result << el if block.call(el)
    end
    result
  end

  def self.sum_reducer(array)
    result = 0
    each(array) do |el|
      result += el
    end
    result
  end

  def self.factorial_reducer(array)
    result = 1
    each(array) do |el|
      result *= el
    end
    result
  end

  private

  def self.each(array)
    for el in array
      yield el
    end
  end
end

class BookKeeping
  VERSION = 2
end
