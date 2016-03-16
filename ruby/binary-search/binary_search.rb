class BinarySearch
  attr_reader :list

  def initialize(list)
    raise ArgumentError if list != list.sort
    @list = list
  end

  def search_for(item)
    min = 0
    max = list.length - 1

    while min < max
      mid = (min + max) / 2
      return mid if list[mid] == item

      if item > list[mid]
        min = mid + 1
      else
        max = mid - 1
      end
    end

    raise RuntimeError
  end

  def middle
    list.length / 2
  end
end
