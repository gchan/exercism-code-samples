class Element
  attr_accessor :datum, :next, :prev

  def initialize(datum, next_el = nil, prev_el = nil)
    @datum = datum
    @next  = next_el
    @prev  = prev_el
  end
end

class Deque
  attr_reader :head, :tail

  def push(datum)
    el = Element.new(datum, nil, tail)
    tail.next = el if tail

    @tail = el
    @head = tail unless head
  end

  def pop
    return nil unless tail

    el = tail

    if head == tail
      @head = nil
    else
      @tail = tail.prev
      tail.next = nil
    end

    el.datum
  end

  def unshift(datum)
    el = Element.new(datum, head)
    head.prev = el if head

    @head  = el
    @tail = head unless tail
  end

  def shift
    return nil unless head

    el = head

    if head == tail
      @tail = nil
    else
      @head = head.next
      head.prev = nil
    end

    el.datum
  end
end
