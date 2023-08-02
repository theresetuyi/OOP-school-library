require_relative '../decorator'
require_relative '../nameable'
require_relative '../capitalize_decorator'

class DummyNameableCapitalize < Nameable
  def correct_name
    'dummy name'
  end
end

describe CapitalizeDecorator do
  let(:nameable_instance_capitalize) { DummyNameableCapitalize.new }

  describe '#correct_name' do
    it 'returns the correct_name value in capitalized form' do
      decorator_capitalize = CapitalizeDecorator.new(nameable_instance_capitalize)
      expect(decorator_capitalize.correct_name).to eq('Dummy name')
    end
  end
end
