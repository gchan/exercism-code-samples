class Clock
  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end

  def to_s
    format('%02d:%02d', hours, minutes)
  end

  def +(add_minutes)
    mins = minutes + add_minutes
    hrs = hours + mins / 60

    mins %= 60
    hrs %= 24

    self.class.new(hrs, mins)
  end

  def -(less_minutes)
    self.+(-less_minutes)
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end
end
