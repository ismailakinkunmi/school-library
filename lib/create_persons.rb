class CreatePerson
  def create_a_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    case option
    when '1'
      create_a_student
    when '2'
      create_a_teacher
    else
      puts 'Oop! Wrong input. Try again.'
      puts
    end
  end

  def inputs_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parents permission ? [y/n]: '
    parent_permission = gets.chomp.downcase
    [age, name, parent_permission]
  end

  def create_a_student
    age, name, parent_permission = inputs_student
    case parent_permission
    when 'n'
      student = Student.new(age, name, parent_permission: false)
      puts
      puts 'Student created successfully!'
      puts
    when 'y'
      student = Student.new(age, name, parent_permission: true)
      puts
      puts 'Student created successfully!'
      puts
    end
    student
  end

  def inputs_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    [age, specialization, name]
  end

  def create_a_teacher
    age, specialization, name = inputs_teacher
    teacher = Teacher.new(age, specialization, name)
    puts
    puts 'Teacher created successfully!'
    puts
    teacher
  end
end
