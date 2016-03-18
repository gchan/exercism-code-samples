class CustomSet
  attr_reader :data

  def initialize(data = [])
    @data = data.to_a.uniq
  end

  def ==(other)
    other.data.sort == data.sort
  end

  def put(item)
    @data << item unless member?(item)
    self
  end

  def delete(item)
    data.delete_if { |i| i.equal?(item) }
    self
  end

  def difference(other)
    CustomSet.new(data - other.data)
  end

  def intersection(other)
    CustomSet.new(data & other.data)
  end

  def union(other)
    CustomSet.new(data.concat(other.data))
  end

  def disjoint?(other)
    intersection(other).empty?
  end

  def subset?(other)
    other.difference(self).empty?
  end

  def empty
    CustomSet.new
  end

  def member?(item)
    data.any? { |i| i.equal?(item) }
  end

  def size
    data.size
  end

  def empty?
    size.zero?
  end

  def to_a
    data.to_a
  end
end
