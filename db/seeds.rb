# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Reservation.destroy_all
Scooter.destroy_all
User.destroy_all

# 10.times do
#   user = User.new({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, address: Faker::Address.city, avatar: Faker::Avatar.image, password: 'ASDFLJASDJF'})
#   if user.save
#     puts "#{user.first_name} saved"
#   end
# end

user1 = User.new({ first_name: 'Sandi', last_name: 'Huynh', email: 'shopelite510@gmail.com', address: 'Amsterdam South', avatar: "https://avatars0.githubusercontent.com/u/26726874?v=3", password: '123456'})
if user1.save
  puts "#{user1.first_name} saved"
end

user2 = User.new({ first_name: 'Ruby', last_name: 'Kim', email: 'rubyk70231@gmail.com', address: 'Amsterdam East', avatar: 'https://avatars3.githubusercontent.com/u/29701859?v=3', password: '123456'})
if user2.save
  puts "#{user2.first_name} saved"
end

user3 = User.new({ first_name: 'Ash', last_name: 'Madi', email: 'a.madi27@gmail.com', address: 'Amsterdam South', avatar: 'https://avatars0.githubusercontent.com/u/29701748?v=4', password: '123456'})
if user3.save
  puts "#{user3.first_name} saved"
end


scooter_makes = ['Honda', 'Vespa', 'Yamaha', 'BMW', 'Genuine', 'Evolve', 'Boxx', 'California', 'Piaggio', 'Kawasaki' ]
scooter_model = ['Batscoot', 'Urban Panther', 'Hobbit Slayer', 'Night Hawk', 'Urban Explorer 2.0', 'Classic line', 'NF 600', 'A2-300', 'Scooteroo', 'Brokeback Scoot']
scooter_location = ['Nieuwmarkt 15, 1011 JR Amsterdam', 'Gravenstraat 2, 1012 NM Amsterdam', 'Paleisstraat 16, 1012 RB Amsterdam', 'Reguliersdwarsstraat 87, 1017 BK Amsterdam', 'Nieuwe Achtergracht 170, 1018 WV Amsterdam', 'Bellamyplein 51, 1053 AT Amsterdam', 'Saenredamstraat 32, 1072 CH Amsterdam', 'Derde Goudsbloemdwarsstraat 2, 1015 KA Amsterdam', 'Prins Hendrikkade 121, 1011 AM Amsterdam', 'Leidsegracht 84, 1016 CR Amsterdam']
scooter_pics = ['http://i32.photobucket.com/albums/d7/idahosam/Sears_Allstate_Vespa_1966_654321.jpg', 'https://s-media-cache-ak0.pinimg.com/originals/89/19/01/89190169e1bd8437f74c69b7498409e7.jpg', 'https://s-media-cache-ak0.pinimg.com/736x/f5/d7/40/f5d7403e31ea78d013ca4ad04bc6d7fe.jpg', 'https://s-media-cache-ak0.pinimg.com/originals/3f/e9/7e/3fe97e0997b7c59ba6bd9158cf284ed4.jpg', 'http://i.dailymail.co.uk/i/pix/2011/08/04/article-2022383-0D4B716F00000578-875_634x400.jpg', 'https://images.pexels.com/photos/159210/vespa-roller-motor-scooter-cult-159210.jpeg', 'https://images.pexels.com/photos/159192/vespa-roller-motor-scooter-cult-159192.jpeg', 'https://images.pexels.com/photos/221299/pexels-photo-221299.jpeg', 'https://images.pexels.com/photos/205912/pexels-photo-205912.jpeg', 'https://lovedubs.files.wordpress.com/2007/09/m1400.jpg?w=450']

10.times do
  scooter_attributes = {
    make: scooter_makes.pop,
    model: scooter_model.pop,
    location: scooter_location.pop,
    price: rand(15..40),
    picture: scooter_pics.pop,
    availability: true,
    user: User.all.sample,
  }

  scooter = Scooter.new(scooter_attributes)
  if scooter.save
    puts "#{scooter.make} saved"
  end
end
