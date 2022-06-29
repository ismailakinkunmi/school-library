require_relative 'lib/capitalize_decorator'
require_relative 'lib/trimmer_decorator'
require_relative 'lib/create_persons'
require_relative 'lib/create_rental'
require_relative 'lib/create_books'
require_relative 'lib/classroom'
require_relative 'lib/load_data'
require_relative 'lib/displayer'
require_relative 'lib/teacher'
require_relative 'lib/student'
require_relative 'lib/person'
require_relative 'lib/rental'
require_relative 'lib/book'

class App
  attr_accessor :books, :persons, :rentals

  def initialize
    initialize_files
    @books = load_books
    @persons = load_persons
    @rentals = load_rentals(@books, @persons)
    @displayer = Displayer.new
  end

  def list_all_books
    @displayer.display_books_list(@books)
  end

  def list_all_persons
    @displayer.display_persons_list(@persons)
  end

  def create_a_book
    @books << CreateBook.new.create_a_book
  end

  def create_a_student
    @persons << CreatePerson.new.create_a_student
  end

  def create_a_teacher
    @persons << CreatePerson.new.create_a_teacher
  end

  def create_a_person
    @persons << CreatePerson.new.create_a_person
  end

  def create_a_rental
    @rentals << CreateRental.new.create_a_rental(@books, @persons)
  end

  def list_rental_person
    @displayer.display_rentals_list(@persons, @rentals)
  end
end
