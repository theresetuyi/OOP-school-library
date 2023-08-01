require 'json'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end
end

# Read the JSON data from the 'book.json' file
json_data = File.read('book.json')

# Parse the JSON data to convert it into a Ruby data structure (array of hashes)
books_array = JSON.parse(json_data)

# Display the information for each book
books_array.each do |book_data|
  book = Book.new(book_data['title'], book_data['author'])
  puts "Title: #{book.title}"
  puts "Author: #{book.author}"
  puts '-' * 20
end
