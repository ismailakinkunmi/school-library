class Person
  def initialize(name = "unknown", age, parent_permission = true)
    @id = id
    @name = name
    @age = age
  end
  attr_reader :id
  attr_accessor :name , age
  
  def can_use_services?
    if is_of_age || parent_permission
      print true
    else
      print false

  end

  private
  def is_of_age (age)
    if age >= 18
      print true
    else
      print false
  end
  
end