require './classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'Label'
  end

  context '#new' do
    it 'should takes one parameters and returns a classroom object' do
      expect(@classroom.instance_of?(Classroom)) == true
    end
  end

  context '#label' do
    it 'should returns the correct label' do
      expect(@classroom.label).to eql 'Label'
    end
  end
end
