require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom:, id: nil, name: 'Unknown', age: nil, parent_permission: true)
    super(id: id, name: name, age: age, parent_permission: parent_permission)
    @classroom = Classroom.new(classroom)
    @classroom.add_student(self) # Use safe navigation (&.) here
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def to_object
    { id: id, name: name, age: age, parent_permission: @parent_permission, classroom: @classroom.label,
      type: self.class.name }
  end
end
