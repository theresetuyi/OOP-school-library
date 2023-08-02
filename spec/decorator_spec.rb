require_relative '../decorator'
require_relative '../nameable'

class DummyNameable < Nameable
  def correct_name
    'Dummy'
  end
end

describe Decorator do
  let(:nameable_instance) { DummyNameable.new }

  describe '#correct_name' do
    it 'returns the decorated correct_name value' do
      decorator = Decorator.new(nameable_instance)
      expect(decorator.correct_name).to eq('Dummy')
    end
  end
end
