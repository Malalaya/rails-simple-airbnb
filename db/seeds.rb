require 'faker'

# Clean the database
puts 'Cleaning database...'
Flat.destroy_all

# Create 10 fake flats
puts 'Creating flats...'
10.times do
  flat = Flat.new(
    name: Faker::Lorem.unique.words(number: 2).join(" "),
    address: Faker::Address.full_address,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    price_per_night: Faker::Number.between(from: 50, to: 200),
    number_of_guests: Faker::Number.between(from: 1, to: 6)
  )
  flat.save!
end

puts 'Finished!'
