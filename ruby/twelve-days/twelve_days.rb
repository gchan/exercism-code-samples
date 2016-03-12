class TwelveDays
  VERSION = 1

  PARTS = [
    "and a Partridge in a Pear Tree.",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming"
  ]

  DAYS = %w(first second third fourth fifth sixth seventh eighth
    ninth tenth eleventh twelfth)

  def self.song
    (0..11).map { |verse| verse(verse) }.join("\n")
  end

  def self.verse(verse)
    str = "On the #{DAYS[verse]} day of Christmas my true love gave to me, "

    if verse == 0
      str += PARTS[verse].sub("and ", "")
    else
      str += (0..verse).to_a.reverse.map { |index| PARTS[index] }.join(", ")
    end

    str + "\n"
  end
end
