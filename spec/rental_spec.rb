require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Rental do
  let(:person) { Person.new(name: 'John Doe', age: 30) }
  let(:book) { Book.new('Title', 'Author') }
  let(:date) { '2023-08-02' }

  describe '#initialize' do
    it 'sets the correct person, book, and date' do
      rental = Rental.new(person, book, date)

      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
      expect(rental.date).to eq(date)
    end

    it 'adds the rental to the person and book objects' do
      expect(person.rentals).to be_empty
      expect(book.rentals).to be_empty

      Rental.new(person, book, date)

      expect(person.rentals).to contain_exactly(kind_of(Rental))
      expect(book.rentals).to contain_exactly(kind_of(Rental))
    end
  end
end
