class Game
  def initialize
    @frames       = Array.new(10) { [] }
    @frame_number = 0
    @pins_up      = 10
  end

  def roll(pins)
    if pins < 0 || pins > 10
      raise RuntimeError.new("Pins must have a value from 0 to 10")
    elsif pins > @pins_up
      raise RuntimeError.new("Pin count exceeds pins on the lane")
    elsif @frame_number == 10
      raise RuntimeError.new("Should not be able to roll after game is over")
    end

    scorable_frames.each { |frame| frame << pins }

    @pins_up -= pins

    @pins_up = 10 if @pins_up.zero?

    if frame_complete?
      @frame_number += 1
      @pins_up = 10
    end
  end

  def score
    case @frame_number
    when 10
      @frames.flatten.reduce(:+)
    when 9
      raise RuntimeError.new("Game is not yet over, cannot score!")
    else
      raise RuntimeError.new("Score cannot be taken until the end of the game")
    end
  end

  private

  def frame_complete?
    if last_frame?
      (current_frame.count == 2 && current_frame_score < 10) || current_frame.count == 3
    else
      current_frame_score == 10 || current_frame.count == 2
    end
  end

  def current_frame
    @frames[@frame_number]
  end

  def current_frame_score
    current_frame.inject(:+) || 0
  end

  def last_frame?
    @frame_number == 9
  end

  def scorable_frames
    @frames[0..@frame_number].select do |frame|
      frame.length < 2 ||
        frame.length < 3 && (strike_frame?(frame) || spare_frame?(frame))
    end
  end

  def strike_frame?(frame)
    frame[0] == 10
  end

  def spare_frame?(frame)
    frame[0..1].inject(:+) == 10
  end
end

module BookKeeping
  VERSION = 1
end
