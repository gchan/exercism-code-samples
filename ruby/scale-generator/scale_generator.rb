class Scale
  INTERVALS  = { m: 1, M: 2, A: 3 }
  SCALE      = %w(A A# B C C# D D# E F F# G G#)
  FLAT_SCALE = %w(A Bb B C Db D Eb E F Gb G Ab)

  FLATS  = %w(F Bb Eb Ab Db Gb d g c f bb eb)

  attr_reader :tonic, :name, :intervals, :scale

  def initialize(tonic, name, intervals = nil)
    @tonic      = tonic.capitalize
    @name       = "#{@tonic} #{name}"
    @intervals  = intervals
    @scale      = FLATS.include?(tonic) ? FLAT_SCALE : SCALE
  end

  def pitches
    index = scale.index(tonic)

    steps.each_with_object([]) do |s, keys|
      keys << scale[(index + s) % 12]
      index += s
    end
  end

  private

  def steps
    return [0] + [1] * 11 if intervals.nil?

    [0] + intervals.chars.map { |interval| INTERVALS[interval.to_sym].to_i }[0..-2]
  end
end
