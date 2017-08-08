# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  user = User.new({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, address: Faker::Address.city, avatar: Faker::Avatar.image, password: 'ASDFLJASDJF'})
  if user.save
    puts "#{user.first_name} saved"
  end
end

10.times do
  Scooter.create({ user: User.all.sample, make: Faker::Vehicle.manufacture, model: Faker::Vehicle.vin, location: Faker::Address.city, availability: true, picture: Faker::LoremPixel.image})
end
