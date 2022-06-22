require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'unknown', _classroom)
    super(age, name)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
