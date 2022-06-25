require './person'
require './student'
require './teacher'
require './rental'
require './book'

class AppMethod
  def initialize
    @rentals = []
    @people = []
    @books = []
  end

  def list_books
    if @books.empty?
      puts 'No book added yet'
      return
    end
    @books.map do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    if @people.empty?
      puts 'No person record created yet'
      return
    end
    @people.map do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input'
      return
    end
    # return
    puts 'Person created successfully'
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    student = Student.new(age, name)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    @people.push(student) if parent_permission == 'n'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def create_rental
    if @books.empty?
      puts 'No Books Available'
    elsif @people.empty?
      puts 'No Person Available'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      rental_book = gets.chomp.to_i

      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      rental_person = gets.chomp.to_i

      print 'input your date here, format {yyyy-mm-dd}: '
      date = gets.chomp
      rental_detail = Rental.new(@people[rental_person], @books[rental_book], date)
      @rentals.push(rental_detail)
      puts 'Rental Successfully Created'

    end
  end

  def list_rentals
    puts 'Select id of any person'
    @people.each { |i| puts "id: #{i.id}, Person: #{i.name}" }
    print 'ID of person: '
    person_id = gets.chomp
    @rentals.each do |i|
      puts "Date: #{i.date}, Book: '#{i.book.title}' by #{i.book.author}" if i.person.id.to_i == person_id.to_i
    end
  end
end
