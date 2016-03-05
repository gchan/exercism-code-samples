class WordProblem
  attr_reader :question

  OPERATIONS = {
    'plus'       => :+,
    'minus'      => :-,
    'divided'    => :/,
    'multiplied' => :*
  }

  def initialize(question)
    @question = question
  end

  def answer
    numbers = question.scan(/(-?\d+)/).flatten.map(&:to_i)

    operations = question.scan(/(plus|minus|multiplied|divided)/).flatten.
      map { |op| OPERATIONS[op] }

    raise ArgumentError if numbers.empty? || operations.empty?

    equation = operations.unshift(:+).zip(numbers).flatten.compact

    equation.each_slice(2).inject(0) do |sum, (operation, number)|
      sum.send(operation, number)
    end
  end
end
