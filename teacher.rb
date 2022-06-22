require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    @specialization = specialization
    super(age, name, parent_permission)
  end

  def can_use_services
    true
  end
end
t = Teacher.new('math', 5)
puts t.specialization.to_s
