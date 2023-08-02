require_relative '../book'

describe Book do
  let(:book) { Book.new('Sample Book', 'John Doe') }

  describe '#add_rental' do
    it 'adds a rental to the book' do
      rental = double('Rental')
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end

  describe '#to_object' do
    it 'returns a hash with title and author' do
      expect(book.to_object).to eq({ title: 'Sample Book', author: 'John Doe' })
    end
  end
end
