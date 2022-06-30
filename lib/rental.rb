require_relative 'book'
require_relative 'person'

<<<<<<< HEAD:lib/rental.rb
class Rental
  attr_accessor :date, :book, :person

=======
>>>>>>> 4ba66dec28894b51096ebf75612ca201b514eeb6:rental.rb
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    person.rentals << self
    book.rentals << self
  end
end
