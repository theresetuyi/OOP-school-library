require_relative '../student'
require_relative '../classroom'

describe Classroom do
  let(:classroom_label) { 'Math Class' }
  let(:student_params) { { name: 'John Doe', age: 15 } }

  describe '#initialize' do
    it 'creates a classroom with the correct label' do
      classroom = Classroom.new(classroom_label)
      expect(classroom.label).to eq(classroom_label)
    end

    it 'initializes an empty array of students' do
      classroom = Classroom.new(classroom_label)
      expect(classroom.students).to be_empty
    end
  end
end
