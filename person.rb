require './decorator'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def of_age
    @age >= 18
  end

  def can_use_services
    of_age || parent_permission
  end

  def correct_name
    @name
  end

  private :of_age
end
