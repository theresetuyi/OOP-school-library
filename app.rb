require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts 'List of all books:'
    @books.each { |book| puts "#{book.title} by #{book.author}" }
  end

  def list_all_people
    puts 'List of all people:'
    @people.each do |person|
      person_type = person.is_a?(Teacher) ? 'Teacher' : 'Student'
      puts "#{person.name} (#{person_type})"
    end
  end

  def create_person(options)
    name = options[:name]
    age = options[:age]
    type = options[:type]
    classroom = options[:classroom]
    specialization = options[:specialization]
    parent_permission = options.fetch(:parent_permission, true)

    if type == 'teacher'
      person = Teacher.new(name: name, age: age, parent_permission: parent_permission, specialization: specialization)
    elsif type == 'student'
      person = Student.new(name: name, age: age, parent_permission: parent_permission, classroom: classroom)
    else
      puts 'Invalid person type. Please specify either "teacher" or "student".'
      return
    end

    @people << person
    puts "#{person.name} (#{type.capitalize}) created."
    display_person_info(person)
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "#{book.title} by #{book.author} created."
  end

  def create_rental(person_id, book_title, rental_date)
    person = find_person_by_id(person_id)
    book = find_book_by_title(book_title)

    if person.nil? || book.nil?
      puts 'Person or book not found. Please check the provided IDs and titles.'
      return
    end

    rental = Rental.new(person, book, rental_date)
    @rentals << rental
    puts "Rental created for #{person.name} (ID: #{person.id}) - #{book.title} (#{rental.date})."
  end

  def list_rentals_for_person(person_id)
    person = find_person_by_id(person_id)

    if person.nil?
      puts 'Person not found. Please check the provided ID.'
      return
    end

    puts "Rentals for #{person.name} (ID: #{person.id}):"
    rentals = @rentals.select { |rental| rental.person == person }
    rentals.each { |rental| puts "- #{rental.book.title} (#{rental.date})" }
  end

  def create_person_interactively
    puts 'Enter person name:'
    name = gets.chomp

    puts 'Enter person age:'
    age = gets.chomp.to_i

    puts 'Is this person a teacher or student?'
    type = gets.chomp.downcase

    if type == 'teacher'
      puts 'Enter teacher specialization:'
      specialization = gets.chomp
      create_person(name: name, age: age, type: type, specialization: specialization)
    elsif type == 'student'
      puts 'Enter student classroom label:'
      classroom_label = gets.chomp
      classroom_instance = Classroom.new(classroom_label)
      create_person(name: name, age: age, type: type, classroom: classroom_instance)
    else
      puts 'Invalid person type. Please specify either "teacher" or "student".'
    end
  end

  def create_book_interactively
    puts 'Enter book title:'
    title = gets.chomp

    puts 'Enter book author:'
    author = gets.chomp

    create_book(title, author)
  end

  def create_rental_interactively
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i

    puts 'Enter book title:'
    book_title = gets.chomp

    puts 'Enter rental date (YYYY-MM-DD):'
    rental_date = gets.chomp

    create_rental(person_id, book_title, rental_date)
  end

  private

  def find_person_by_id(id)
    @people.find { |person| person.id == id }
  end

  def find_book_by_title(title)
    @books.find { |book| book.title == title }
  end

  def display_person_info(person)
    puts 'Person Details:'
    puts "Name: #{person.name}"
    puts "Age: #{person.age}"
    if person.is_a?(Teacher)
      puts 'Type: Teacher'
      puts "Specialization: #{person.specialization}"
    elsif person.is_a?(Student)
      puts 'Type: Student'
      puts "Classroom: #{person.classroom&.label}"
    end
  end
end
