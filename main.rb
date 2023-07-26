require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

# Creating persons
person1 = Person.new(name: 'John', age: 25)
person2 = Person.new(name: 'Alice', age: 17, parent_permission: false)

# Creating books
book1 = Book.new('Book A', 'Author A')
book2 = Book.new('Book B', 'Author B')

# Creating rentals and establishing relationships
Rental.new(person1, book1, '2023-07-26')
Rental.new(person1, book2, '2023-07-27')
Rental.new(person2, book1, '2023-07-28')

# Accessing rentals for a person and a book
puts "#{person1.name}'s rentals:"
person1.rentals.each { |rental| puts "- #{rental.book.title} (#{rental.date})" }

puts "#{book1.title}'s rentals:"
book1.rentals.each { |rental| puts "- #{rental.person.name} (#{rental.date})" }
