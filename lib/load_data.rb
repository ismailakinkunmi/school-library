require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

def initialize_files
  File.write('./data/books.json', []) unless File.exist?('./data/books.json')
  File.write('./data/persons.json', []) unless File.exist?('./data/persons.json')
  File.write('./data/rentals.json', []) unless File.exist?('./data/rentals.json')
end

def load_books
  books = []
  books_save = JSON.parse(File.read('./data/books.json'))

  books_save.each do |book|
    books << Book.new(book['title'], book['author'])
  end
  books
end

def load_persons
  persons = []
  persons_save = JSON.parse(File.read('./data/persons.json'))

  persons_save.each do |person|
    persons << case person['json_class']
               when 'Student'
                 Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
               when 'Teacher'
                 Teacher.new(person['age'], person['specialization'], person['name'])
               end
  end
  persons
end

def load_rentals(books, persons)
  rentals = []
  rentals_save = JSON.parse(File.read('./data/rentals.json'))
  rentals_save.each do |r|
    rentals << Rental.new(r['date'],
                          books.select { |b| b.title == r['title'] } [0],
                          persons.select { |person| person.name == r['name'] } [0])
  end
  rentals
end
