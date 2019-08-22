# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all

user1 = User.create!(
    first_name: 'simon',
    last_name: 'chretien',
    email: 'simon@ducknb.com',
    password: 'azerty',
    birthdate: Date.new(),
    address: '2 avenue des saules',
    zip_code: '59000',
    city: 'Lille',
    photo: 'https://picsum.photos/id/236/200/200'
)


user2 = User.create!(
    first_name: 'renald',
    last_name: 'HB',
    email: 'renald@ducknb.com',
    password: 'azerty',
    birthdate: Date.new(),
    address: '2 boulevard carnot',
    zip_code: '59000',
    city: 'Lille',
    photo: 'https://picsum.photos/id/237/300/250'
)

user3 = User.create!(
    first_name: 'moritz',
    last_name: 'michalak',
    email: 'moritzd@ducknb.com',
    password: 'qwertz',
    birthdate: Date.new(),
    address: '20 boulevard de la liberté',
    zip_code: '59000',
    city: 'Lille',
    photo: 'https://picsum.photos/id/238/250/300'
)

user4 = User.create!(
    first_name: 'remi',
    last_name: 'carette',
    email: 'remi@ducknb.com',
    password: 'azerty',
    birthdate: Date.new(),
    address: '20 boulevard de la liberté',
    zip_code: '59000',
    city: 'Lille',
    photo: 'https://picsum.photos/id/239/350/350'
)

# CREATE 2 / 4 / 6 DUCKS PER USER

races = [
    'Canard de Pékin',
    'Canard de Rouen',
    'Coureur Indien',
    'Canard Huppé',
    'Canard de Saxe',
    'Abacot Ranger',
    'Canard Mignon',
    'Arlequin Gallois']

sexs = ['Male', 'Female']
rand_i_races = (rand() * races.size - 1).round
rand_i_sexs = (rand() * sexs.size - 1).round

# create 4 ducks for user 1
4.times do
    Duck.create!(
        birthdate: Date.new(),
        name: Faker::Creature::Animal.name,
        race: races[rand_i_races],
        sex: sexs[rand_i_sexs],
        colour: Faker::Color.color_name,
        weight: (rand() * 50 + 10).round,
        tags: "cool,funny,noisy,smiling",
        user: user1
    )
end

# create 2 ducks for user2
2.times do
    Duck.create!(
        birthdate: Date.new(),
        name: Faker::Creature::Animal.name,
        race: races[rand_i_races],
        sex: sexs[rand_i_sexs],
        colour: Faker::Color.color_name,
        weight: (rand() * 50 + 10).round,
        tags: "cool,funny,noisy,smiling",
        user: user2
    )
end

# create 6 ducks for user3

6.times do
    Duck.create!(
        birthdate: Date.new(),
        name: Faker::Creature::Animal.name,
        race: races[rand_i_races],
        sex: sexs[rand_i_sexs],
        colour: Faker::Color.color_name,
        weight: (rand() * 50 + 10).round,
        tags: "cool,funny,noisy,smiling",
        user: user3
    )
end

# create 10 ducks for user4

10.times do
    d = Duck.new(
        birthdate: Date.new(),
        name: Faker::Creature::Animal.name,
        race: races[rand_i_races],
        sex: sexs[rand_i_sexs],
        colour: Faker::Color.color_name,
        weight: (rand() * 50 + 10).round,
        tags: "cool,funny,noisy,smiling",
        user: user4
    )

    d.remote_photo_url = "https://picsum.photos/200/300"
    d.save!
end


# SEEDS DUCKS PHOTOS =========================================

# get all users to get all ducks
# for each duck, we create a new duckphoto

# CLOUDINARY SEED = "https://upload.wikimedia.org/wikipedia/commons/a/a1/Mallard2.jpg"
# duck = Duck.last
# picture = DuckPhoto.new(name: 'Cloudinary test', duck: duck)
# picture.remote_photo_url = url
# picture.save!


# url = "https://www.ducks.ca/assets/2016/11/mallard-hen.jpg"
# picture2 = DuckPhoto.new(name: 'Cloudinary test 2', duck: duck)
# picture2.remote_photo_url = url
# picture2.save!

# users = User.all

# users.each do |user|
#     count = 1
#     user.ducks.each do |duck|
#         picture = DuckPhoto.new(
#             duck: duck,
#             name: Faker::FunnyName.name
#         )
#         picture.remote_url_url = "https://picsum.photos/200/300?random=#{count}"
#         picture.save!
#         count += 1
#         picture = DuckPhoto.new(
#             duck: duck,
#             name: Faker::FunnyName.name
#         )
#         picture.remote_url_url = "https://picsum.photos/200/300?random=#{count}"
#         picture.save!
#         count += 1
#     end
# end


# BOOKINGS SEEDS ==============================

# get all users
# for each users we get ducks
# we take 50% ducks
# for each of this ducks we create a booking
# with randoms date


# add bookings for 50% of ducks

def create_rand_start_end_dates(duration)
    year = 2019
    month = (rand() * 11 + 1).round
    day = (rand() * 27 + 1).round
    date = Date.parse("#{year}-#{month}-#{day}")
    dates = { start: date, end: date+duration }
end

status = ['pending', 'refused', 'accepted']

@bookings_counter = 0

users = User.all

users.each do |user|

    size = user.ducks.size

    count = 0
    size.times do
    dates = create_rand_start_end_dates((rand()*21 + 1).round)
        (rand()*5 + 1).round().times do
            Booking.create!(
                user: user,
                duck: user.ducks[count],
                start: dates[:start],
                end: dates[:end],
                status: status[rand()*status.size]
            )
            @bookings_counter += 1
        end
       count += 1
    end
end


# REVIEWS SEEDS ===============================

bookings = Booking.all

bookings.each do |booking|
    Review.create!(
        booking: booking,
        content: Faker::Lorem.sentences(number: 1),
        stars: (rand()*5).round()
    )
end

# SEEDS TEST =================================

puts "Users created : #{User.count}/4"
puts "Ducks created : #{Duck.count}/22"
puts "Ducks photos created : #{DuckPhoto.count}/22"
puts "Bookings created : #{Booking.count}/#{@bookings_counter}"
puts "Reviews created: #{Review.count}/#{Booking.count}"

renald = User.find_by(first_name: 'renald')
moritz = User.find_by(first_name: 'moritz')
simon = User.find_by(first_name: 'simon')
remi = User.find_by(first_name: 'remi')


puts ""
puts renald.first_name
puts "Ducks created : #{renald.ducks.size}/2"
puts "Ducks created : #{renald.duck_photos.size}/2"
puts "Bookings : #{renald.bookings.size}"
puts "Ducks reviews : #{renald.reviews.size}"

puts ""
puts moritz.first_name
puts "Ducks created : #{moritz.ducks.size}/6"
puts "Ducks photos created : #{moritz.duck_photos.size}/6"
puts "Bookings : #{moritz.bookings.size}"
puts "Ducks reviews : #{moritz.reviews.size}"


puts ""
puts simon.first_name
puts "Ducks created : #{simon.ducks.size}/4"
puts "Ducks photos created : #{simon.duck_photos.size}/4"
puts "Bookings : #{simon.bookings.size}"
puts "Ducks reviews : #{simon.reviews.size}"

puts ""
puts remi.first_name
puts "Ducks created : #{remi.ducks.size}/10"
puts "Ducks photos created : #{remi.duck_photos.size}/10"
puts "Bookings : #{remi.bookings.size}"
puts "Ducks reviews : #{remi.reviews.size}"
