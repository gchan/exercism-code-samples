class FlattenArray
  VERSION = 1

  def self.flatten(array)
    array.reject(&:nil?).each_with_object([]) do |item, result|
      if item.is_a?(Array)
        FlattenArray.flatten(item).each do |item|
          result << item
        end
      else
        result << item
      end
    end
  end
end
