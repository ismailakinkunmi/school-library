require './student'

describe Student do
  before :each do
    @student = Student.new('Basic3', 15, 'John', true)
  end

  describe '#new' do
    it 'should takes two parameters and returns a student object' do
      expect(@student.instance_of?(Student)) == true
    end
  end

  describe '#name' do
    it 'should returns the correct name' do
      expect(@student.name).to eql 'John'
    end
  end

  describe '#age' do
    it 'should returns the correct age' do
      expect(@student.age).to eql 15
    end
  end
end
