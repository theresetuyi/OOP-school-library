class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name: 'Unknown', age: nil, parent_permission: true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age.to_i >= 18
  end

  def generate_id
    # Implementation to generate a unique ID
    # You can customize this method based on your needs
    # For simplicity, let's assume it returns a random number between 1000 and 9999
    rand(1000..9999)
  end
end
