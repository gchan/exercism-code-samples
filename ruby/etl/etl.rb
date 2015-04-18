class ETL
  def self.transform(original)
    result = {}

    original.each do |score, letters|
      letters.each do |letter|
        result[letter.downcase] = score
      end
    end

    result
  end
end
