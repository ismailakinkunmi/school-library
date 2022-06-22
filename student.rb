require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'unknown')
    @classroom = classroom
    super(age, name)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
