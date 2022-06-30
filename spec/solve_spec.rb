context 'Testing solver class => fizzbuzz' do
    it 'When N is divisible by 3, returns fizz' do
      calc = Solver.new
      @fizzbuzz = calc.fizzbuzz(3)
      expect(@fizzbuzz).to eq('fizz')
    end

    it 'When N is divisible by 5, returns buzz' do
      @fizzbuzz = solver.fizzbuzz(5)
      expect(@fizzbuzz).to eq('buzz')
    end

    it 'When N is divisible by 3 and 5, returns fizzbuzz' do
      @fizzbuzz = solver.fizzbuzz(15)
      expect(@fizzbuzz).to eq('fizzbuzz')
    end

    it 'Any other case, return N as a string' do
      @fizzbuzz = solver.fizzbuzz(4)
      expect(@fizzbuzz).to eq('4')
    end
  end