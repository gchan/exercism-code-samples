class School
  def school
    @school ||= {}
    @school = Hash[@school.sort]
  end

  def to_hash
    school
  end

  def add(student, grade)
    school[grade] ||= []
    school[grade] << student

    school[grade].sort!
  end

  def grade(grade)
    to_hash[grade] || []
  end
end