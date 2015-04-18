module Enumerable
  def accumulate
    result = []

    each do |el|
      result << yield(el)
    end

    result
  end
end
