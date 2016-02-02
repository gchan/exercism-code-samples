class Meetup
  attr_reader :month, :year

  def initialize(month, year)
    @month, @year = month, year
  end

  def day(weekday, schedule)
    start_date = Date.new(year, month)
    end_date   = start_date.next_month - 1

    select_method = :"#{weekday}?"
    candidates = (start_date..end_date).select(&select_method)

    case schedule
    when :first
      candidates[0]
    when :second
      candidates[1]
    when :third
      candidates[2]
    when :fourth
      candidates[3]
    when :last
      candidates.last
    when :teenth
      candidates.find { |date| date.mday.between?(13, 19) }
    end
  end
end
