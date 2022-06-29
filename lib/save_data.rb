require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

def save_data(books, persons, rentals)
  save_books(books)
  save_persons(persons)
  save_rentals(rentals)
end

def save_books(books)
  books_save = []
  books.each do |book|
    books_save << {
      title: book.title,
      author: book.author
    }
  end

  ruby = JSON.generate(books_save)

  File.write('./data/books.json', ruby.to_s)
end

def save_persons(persons)
  persons_save = []
  persons.each do |person|
    persons_save << if person.instance_of? Student
                      {
                        json_class: 'Student',
                        name: person.name,
                        age: person.age,
                        classroom: person.classroom,
                        parent_permission: person.parent_permission
                      }
                    elsif person.instance_of? Teacher
                      {
                        json_class: 'Teacher', name: person.name, age: person.age, specialization: person.specialization
                      }
                    end
  end

  ruby = JSON.generate(persons_save)

  File.write('./data/persons.json', ruby.to_s)
end

def save_rentals(rentals)
  data = []
  rentals.each do |rental|
    data.push({
                date: rental.date,
                person_id: rental.person.id,
                book_id: rental.book.id,
                name: rental.person.name,
                title: rental.book.title,
                author: rental.book.author
              })
  end

  ruby = JSON.generate(data)

  File.write('./data/rentals.json', ruby)
end
