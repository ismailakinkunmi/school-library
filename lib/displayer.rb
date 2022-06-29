class Displayer
  def display_persons_list(persons)
    puts 'Database is empty! Add a person.' if persons.empty?
    persons.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
    puts
  end

  def display_books_list(books)
    puts 'Database is empty! Add a book.' if books.empty?
    books.each { |book| puts "[Book] Title: \"#{book.title}\", Author: #{book.author}" }
    puts
  end

  def display_rentals_list(persons, rentals)
    puts 'To see person rentals enter the person ID: '
    persons.each do |person|
      puts "ID: #{person.id} as \"#{person.name}\""
    end

    id = gets.chomp.to_i

    puts
    puts 'Rentals Books: '
    rentals.each do |rental|
      if rental.person.id == id
        puts "[#{rental.person.name}] Date: \"#{rental.date}\", Book: \"#{rental.book.title}\" by #{rental.book.author}"
      else
        puts ''
      end
      puts
    end
  end
end
