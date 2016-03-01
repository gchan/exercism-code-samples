class Element
  attr_reader :datum, :next

  def initialize(datum, next_el = nil)
    @datum = datum
    @next  = next_el
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  include Enumerable
  attr_reader :head

  def self.from_a(array)
    list = SimpleLinkedList.new
    array.reverse.each { |datum| list.push(datum) } if array
    list
  end

  def each
    el = head

    while el
      yield el
      el = el.next
    end
  end

  def size
    count
  end

  def empty?
    none?
  end

  def peek
    first&.datum
  end

  def push(datum)
    @head = Element.new(datum, head)
  end

  def pop
    if any?
      datum = head.datum
      @head = head.next
    end

    datum
  end

  def to_a
    super.map(&:datum)
  end

  def reverse
    each_with_object(SimpleLinkedList.new) do |el, list|
      list.push(el.datum)
    end
  end
end
