class Brackets
  BRACKETS = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }

  def self.paired?(string)
    stack = []

    string.chars.each do |char|
      if BRACKETS.keys.include?(char)
        stack.push(char)
      elsif BRACKETS.values.include?(char)
        return false unless BRACKETS[stack.pop] == char
      end
    end

    stack.empty?
  end
end

module BookKeeping
  VERSION = 2
end
