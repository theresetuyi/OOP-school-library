require_relative '../person'
require_relative '../nameable'
require_relative '../teacher'

describe Teacher do
  let(:teacher_params) { { specialization: 'Math', name: 'John Doe', age: 30 } }

  describe '#initialize' do
    it 'sets the correct specialization' do
      teacher = Teacher.new(**teacher_params)
      expect(teacher.specialization).to eq('Math')
    end

    it 'sets the default values correctly' do
      teacher = Teacher.new(specialization: 'Science')
      expect(teacher.name).to eq('Unknown')
      expect(teacher.age).to be_nil
    end
  end

  describe '#can_use_services?' do
    it 'returns true for a teacher' do
      teacher = Teacher.new(**teacher_params)
      expect(teacher.can_use_services?).to be_truthy
    end
  end

  describe '#to_object' do
    it 'returns a hash with the correct attributes' do
      teacher = Teacher.new(**teacher_params)
      expect(teacher.to_object).to eq({
                                        id: teacher.id, name: 'John Doe', age: 30, parent_permission: true,
                                        specialization: 'Math', type: 'Teacher'
                                      })
    end
  end
end
