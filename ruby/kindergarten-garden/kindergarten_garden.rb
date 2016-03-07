class Garden
  attr_reader :diagram, :students

  STUDENTS = %w(alice bob charlie david eve fred ginny
    harriet ileana joseph kincaid larry)

  PLANTS   = {
    "C" => :clover,
    "R" => :radishes,
    "G" => :grass,
    "V" => :violets
  }

  def initialize(diagram, students = STUDENTS)
    @diagram  = diagram
    @students = students.map(&:downcase).sort
  end

  def method_missing(method)
    index = students.index(method.to_s)

    diagram.split("\n").
      map { |row| row.chars.each_slice(2).to_a }.
      transpose.
      map { |cups| cups.flatten }.
      [](index).
      map { |plant| PLANTS[plant] }
  end
end
