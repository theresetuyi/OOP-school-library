require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom:, name: 'Unknown', age: nil, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
    classroom&.add_student(self) # Use safe navigation (&.) here
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
