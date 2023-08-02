require_relative '../person'
require_relative '../nameable'

describe Person do
  let(:person) { Person.new(id: 123, name: 'Alice', age: 25) }

  describe '#can_use_services?' do
    context 'when person is of age' do
      it 'returns true' do
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when person is underage with parent permission' do
      let(:person) { Person.new(id: 456, name: 'Bob', age: 15, parent_permission: true) }

      it 'returns true' do
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when person is underage without parent permission' do
      let(:person) { Person.new(id: 789, name: 'Charlie', age: 17, parent_permission: false) }

      it 'returns false' do
        expect(person.can_use_services?).to be(false)
      end
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the person' do
      rental = double('Rental')
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
