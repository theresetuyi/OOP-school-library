require_relative '../person' # Replace with the path to your subclass file

describe Person do
  describe '#correct_name of Nameable' do
    it 'raises NotImplementedError when called directly' do
      person = Person.new
      expect do
        person.correct_name
      end.to raise_error(NotImplementedError, 'Subclasses must implement the correct_name method.')
    end
  end
end
