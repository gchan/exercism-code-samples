class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(element)
    if element <= data
      left ? left.insert(element) : @left = Bst.new(element)
    else
      right ? right.insert(element) : @right = Bst.new(element)
    end
  end

  def each(&block)
    left.each(&block) if left
    yield data
    right.each(&block) if right
  end
end
