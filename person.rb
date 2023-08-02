require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(id: nil, name: 'Unknown', age: nil, parent_permission: true)
    super()
    @id = id.nil? ? generate_id : id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(rental)
    @rentals << rental
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
