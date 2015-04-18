class Bob
  def hey(remark)
    if remark[/[A-Z]{4,}/] || remark[/[A-Z]+!/]
      'Whoa, chill out!'
    elsif remark[-1] == '?'
      'Sure.'
    elsif remark.strip.empty?
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end
