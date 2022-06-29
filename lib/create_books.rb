class CreateBook
  def inputs_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    [title, author]
  end

  def create_a_book
    title, author = inputs_book
    book = Book.new(title, author)
    puts 'Book created successfully'
    puts
    book
  end
end
