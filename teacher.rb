require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    @specialization = specialization
    super(age, name, parent_permission)
  end

  def can_use_services?
    true
  end
end
