class Robot
  attr_reader :name

  def initialize
    generate_name
  end

  def reset
    generate_name
  end

  private

  def generate_name
    @name = ('A'..'Z').to_a.sample(2).join
    @name << (1..10).to_a.sample(3).join
  end
end
