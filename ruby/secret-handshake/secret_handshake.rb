class SecretHandshake
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def commands
    return [] unless number.to_s.match(/\A\d+\z/)

    actions = ["wink", "double blink", "close your eyes", "jump"]

    handshake = []

    actions.each_with_index do |instruction, position|
      mask = 1 << position
      handshake << instruction if (mask & number).nonzero?
    end

    if (number & 16).nonzero?
      handshake.reverse
    else
      handshake
    end
  end
end
