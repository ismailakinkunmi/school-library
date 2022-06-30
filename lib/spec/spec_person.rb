require './person'
require './book'

describe Person do
  before :each do
    @person = Person.new(25, 'Name')
  end

  context '#new' do
    it 'should return a person obj. while taking two parameters' do
      expect(@person).to be_instance_of Person
    end
  end

  context '#age' do
    it 'should return a correct age' do
      expect(@person.age).to eql 25
    end
  end

  context '#name' do
    it 'should return the correct name' do
      expect(@person.name).to eql 'Name'
    end
  end

  context '#can_use_services? method test' do
    it 'Should return true if age >= 18 or parent_permission: true ' do
      person1 = Person.new(10, 'Name', parent_permission: true)
      expect(person1.can_use_services?).to be true
      person2 = Person.new(20, 'Name', parent_permission: false)
      expect(person2.can_use_services?).to be true
    end
  end

  context 'when add rental method is called' do
    it 'should add the rental request to the array' do
      expect(@person.rentals.length).to eql(0)
      @book = Book.new('Ruby on Rails ', 'marc zukerberg')
      @person.rentals.push(@book)
      expect(@person.rentals.length).to eql(1)
    end
  end
end
