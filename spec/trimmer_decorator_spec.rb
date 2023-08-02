require_relative '../decorator'
require_relative '../nameable'
require_relative '../trimmer_decorator'

class DummyNameableTrimmer < Nameable
  def correct_name
    'long name is long'
  end
end

describe TrimmerDecorator do
  let(:nameable_instance_trimmer) { DummyNameableTrimmer.new }

  describe '#correct_name' do
    it 'returns the correct_name value trimmed to 10 characters or less' do
      decorator_trimmer = TrimmerDecorator.new(nameable_instance_trimmer)
      expect(decorator_trimmer.correct_name).to eq('long name ')
    end
  end
end
