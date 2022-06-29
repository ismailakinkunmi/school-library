require_relative 'rental'

class Book
  attr_reader :id
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @id = Random.rand(1..10_000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
