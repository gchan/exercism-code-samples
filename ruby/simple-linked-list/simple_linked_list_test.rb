#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require_relative 'simple_linked_list'

class LinkedListTest < Minitest::Test
  def test_element_datum
    e = Element.new(1)
    assert_equal 1, e.datum
  end

  def test_element_tail
    e = Element.new(1)
    assert e.tail?
  end

  def test_element_next_default
    e = Element.new(1)
    assert_nil e.next
  end

  def test_element_next_initialization
    e1 = Element.new(1)
    e2 = Element.new(2, e1)
    assert_equal e1, e2.next
  end

  def test_empty_list_size
    l = SimpleLinkedList.new
    assert_equal 0, l.size
  end

  def test_empty_list_empty
    l = SimpleLinkedList.new
    assert l.empty?
  end

  def test_pushing_element_on_list
    l = SimpleLinkedList.new
    l.push(1)
    assert_equal 1, l.size
  end

  def test_empty_list_1_element
    l = SimpleLinkedList.new
    l.push(1)
    refute l.empty?
  end

  def test_peeking_at_list
    l = SimpleLinkedList.new
    l.push(1)
    assert_equal 1, l.size
    assert_equal 1, l.peek
  end

  def test_peeking_at_empty_list
    l = SimpleLinkedList.new
    assert_nil l.peek
  end

  def test_access_head_element
    l = SimpleLinkedList.new
    l.push(1)
    assert_instance_of Element, l.head
    assert_equal 1, l.head.datum
    assert l.head.tail?
  end

  def test_items_are_stacked
    l = SimpleLinkedList.new
    l.push(1)
    l.push(2)
    assert_equal 2, l.size
    assert_equal 2, l.head.datum
    assert_equal 1, l.head.next.datum
  end

  def test_push_10_items
    l = SimpleLinkedList.new
    (1..10).each do |datum|
      l.push(datum)
    end
    assert_equal 10, l.size
    assert_equal 10, l.peek
  end

  def test_pop_1_item
    l = SimpleLinkedList.new
    l.push(1)
    assert_equal 1, l.pop
    assert_equal 0, l.size
  end

  def test_popping_frenzy
    l = SimpleLinkedList.new
    (1..10).each do |datum|
      l.push(datum)
    end
    6.times { l.pop }
    assert_equal 4, l.size
    assert_equal 4, l.peek
  end

  def test_from_a_empty_array
    l = SimpleLinkedList.from_a([])
    assert_equal 0, l.size
    assert_nil l.peek
  end

  def test_from_a_nil
    l = SimpleLinkedList.from_a(nil)
    assert_equal 0, l.size
    assert_nil l.peek
  end

  def test_from_a_2_element_array
    l = SimpleLinkedList.from_a([1, 2])
    assert_equal 2, l.size
    assert_equal 1, l.peek
    assert_equal 2, l.head.next.datum
  end

  def test_from_a_10_items
    l = SimpleLinkedList.from_a((1..10).to_a)
    assert_equal 10, l.size
    assert_equal 1, l.peek
    assert_equal 10, l.head.next.next.next.next.next.next.next.next.next.datum
  end

  def test_to_a_empty_list
    l = SimpleLinkedList.new
    assert_equal [], l.to_a
  end

  def test_to_a_of_1_element_list
    assert_equal [1], SimpleLinkedList.from_a([1]).to_a
  end

  def test_to_a_of_2_element_list
    assert_equal [1, 2], SimpleLinkedList.from_a([1, 2]).to_a
  end

  def test_reverse_2_element_list
    list = SimpleLinkedList.from_a([1, 2])
    # list_r and list need not be the same object
    list_r = list.reverse

    assert_equal 2, list_r.peek
    assert_equal 1, list_r.head.next.datum
    assert list_r.head.next.tail?
  end

  def test_reverse_10_element_list
    data = (1..10).to_a
    list = SimpleLinkedList.from_a(data)
    assert_equal data.reverse, list.reverse.to_a
  end

  def test_roundtrip_10_element_array
    data = (1..10).to_a
    assert_equal data, SimpleLinkedList.from_a(data).to_a
  end
end
