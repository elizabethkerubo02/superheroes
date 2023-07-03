require 'faker'

puts "Creating heroes..."

# Create 10 Heroes
10.times do
    # name and super_name
    name = Faker::Games::Heroes.name
    super_name = Faker::Games::Heroes.specialty
    Hero.create(name: name, super_name: super_name)
end

puts "Done creating heroes..."

# Create 20 Powers
puts "Creating powers..."

20.times do
    # name and description
    name = Faker::Superhero.power
    description = Faker::Lorem.paragraph_by_chars(number: 25)
    Power.create(name: name, description: description)
end

puts "Done creating powers..."

# Create 30 HeroPowers
puts "Creating hero powers..."

30.times do
    arr = ["Strong", "Weak", "Average"]

    # strength, power_id, and hero_id
    strength = arr.sample
    power_id = rand(1..20)
    hero_id = rand(1..10)
    HeroPower.create(strength: strength, power_id: power_id, hero_id: hero_id)
end

puts "Done creating hero powers..."