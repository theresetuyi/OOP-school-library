require_relative '../student'
require_relative '../person'
require_relative '../classroom'

describe Student do
  let(:student) { Student.new(classroom: 'A101', id: 789, name: 'Eve', age: 20) }

  describe '#play_hooky' do
    it 'returns the play hooky message' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  describe '#to_object' do
    it 'returns a hash with student details' do
      expect(student.to_object).to eq({
                                        id: 789, name: 'Eve', age: 20, parent_permission: true,
                                        classroom: 'A101', type: 'Student'
                                      })
    end
  end
end
