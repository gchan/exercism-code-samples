class Proverb
  attr_reader :items, :qualifier

  def initialize(*items, qualifier: nil)
    @items     = items
    @qualifier = qualifier
  end

  def to_s
    str = ""

    items.each_cons(2) do |item1, item2|
      str += "For want of a #{item1} the #{item2} was lost.\n"
    end

    first_item = [qualifier, items.first].compact.join(" ")

    str +=  "And all for the want of a #{first_item}."
  end
end
