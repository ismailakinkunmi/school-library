require 'spec_helper'

describe Rental do
  before :each do
    @book = Book.new('Title', 'Author')
    @person = Teacher.new('biology', 40, 'John')
    @rental = Rental.new('Date', @book, @person)
  end

  context '#new' do
    it 'should return a rental obj. while taking two parameters' do
      expect(@rental).to be_an_instance_of Rental
    end
  end

  context '#date' do
    it 'Should return the correct date' do
      expect(@rental.date).to eql 'Date'
    end
  end

  context '#person' do
    it 'Should return the correct person' do
      expect(@rental.person.age).to eql 40
      expect(@rental.person.name).to eql 'John'
    end
  end

  context '#book' do
    it 'Should return the correct book' do
      expect(@rental.book.title).to eql 'Title'
      expect(@rental.book.author).to eql 'Author'
    end
  end

  context 'test if in the Rental object new instances are correctly pushed ' do
    it 'Should return a unique rental when adding a rental to a teacher and a book' do
      sample_book = Book.new('chemistry', 'victor')
      sample_person = Teacher.new('math', 40, 'peter')
      sample_rental = Rental.new '2000-06-09', sample_book, sample_person
      expect(sample_person.rentals.length).to eq 1
      expect(sample_book.rentals.length).to eq 1
      expect(sample_person.rentals).to eql [sample_rental]
    end
  end
end
