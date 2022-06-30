<<<<<<< HEAD
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
=======
require './book'
require './rental'
require './persons_manager'
require './book_manager'
require './rental_manager'
require './json_accessor'

class App
  def initialize
    @book_accessor = JsonAccessor.new('books')
    @person_accessor = JsonAccessor.new('person')
    @rental_accessor = JsonAccessor.new('rental')

    @books = BookManager.new(@book_accessor)
    @people = PersonsManager.new(@person_accessor)
    @rentals = RentalManager.new(book: @books, person: @people, rental_accessor: @rental_accessor)
  end

  #=====Main functionality=====#
  def check_option(option)
    case option
    when '1'
      @books.display_books
    when '2'
      @people.display_persons
    when '3'
      @rentals.display_rentals
    when '4'
      @books.insert_book
    when '5'
      @rentals.insert_rental
    when '6'
      @people.insert_person
    else
      puts 'Thank you for using this App.'
      exit
    end
  end

  def show_menu
    loop do
      puts "\n\nHello, Please choose an option selecting a number:"
      puts "1) List all Books\n2) List all People\n3) List all rentals for a given person id\n4) Create a Book\n"
      puts "5) Create a Rental\n6) Create a Person\n7) Exit"
      option = gets.chomp
      if option == '7'
        @book_accessor.store_data(@books.list_books)
        @person_accessor.store_data(@people.list_people)
        @rental_accessor.store_data(@rentals.list_rentals)
        break
      end
      check_option(option)
    end
>>>>>>> 4ba66dec28894b51096ebf75612ca201b514eeb6
  end
end
