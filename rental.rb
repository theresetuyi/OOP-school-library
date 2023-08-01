require 'date'

class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date

    # Set the rental in the person and book objects
    person.add_rental(self)
    book.add_rental(self)
  end
end
