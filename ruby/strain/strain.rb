module Enumerable
  def keep
    result = []

    each do |el|
      result << el if yield el
    end

    result
  end

  def discard
    keep { |el| !yield el }
  end
end
