require 'json'
require_relative 'nameable'

# 'Person' class definition
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(name: 'Unknown', age: nil, parent_permission: true)
    super()
    @id = generate_id
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
    rand(1000..9999)
  end
end

# Read the JSON data from 'people.json'
json_data = File.read('person.json')

# Parse the JSON data to convert it into a Ruby data structure (array of hashes)
people_array = JSON.parse(json_data)

# Create 'Person' instances and display the information for each person
people_array.each do |person_data|
  person = Person.new(name: person_data['name'], age: person_data['age'])
  puts "Name: #{person.name}"
  puts "Age: #{person.age}"
  puts "ID: #{person.id}"
  puts "Class: #{person_data['class']}"
  puts '-' * 20
end
