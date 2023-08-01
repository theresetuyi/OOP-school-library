require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id: nil, specialization:, name: 'Unknown', age: nil, parent_permission: true)
    super(id: id, name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_object
    {id: id, name: name, age: age, parent_permission: @parent_permission, specialization: specialization, type: self.class.name}
  end
end
