# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


def create_duck(owner, url, name)

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

  d = Duck.new(
    birthdate: Date.new(),
    name: name,
    race: races[(rand() * races.size - 1).round],
    sex: sexs[(rand() * sexs.size - 1).round],
    colour: Faker::Color.color_name,
    weight: (rand() * 50 + 10).round,
    tags: "cool,funny,noisy,smiling",
    user: owner
  )
  d.remote_photo_url = url
  d.save!
  return d
end

def create_booking(status, user, duck)

  p b = Booking.create!(
    user: user,
    duck: duck,
    start: Date.new() + 20,
    end: Date.new() + 25,
    status: status
    )
  return Booking.last
end

def create_review(booking, stars)
  Review.create!(
    booking: booking,
    content: "Incroyable moment avec ce joli canard !",
    stars: stars
    )
end

puts "destroy_all"
User.destroy_all


puts "Create User"

simon = User.create!(
    first_name: 'simon',
    last_name: 'chretien',
    email: 'simon@ducknb.com',
    password: 'azerty',
    birthdate: Date.new(),
    address: '2 avenue des saules',
    zip_code: '59000',
    city: 'Lille',
    photo: 'https://ca.slack-edge.com/T02NE0241-UL7B9TJRW-8ac16206f4ef-48'
)

moritz = User.create!(
    first_name: 'moritz',
    last_name: 'michalak',
    email: 'moritzd@ducknb.com',
    password: 'qwertz',
    birthdate: Date.new(),
    address: '20 boulevard de la liberté',
    zip_code: '59000',
    city: 'Lille',
    photo: 'https://ca.slack-edge.com/T02NE0241-UL7BFB5QQ-0a2dc0a5ae19-48'
)

franck = User.create!(
    first_name: 'franck',
    last_name: 'HB',
    email: 'franck@ducknb.com',
    password: 'azerty',
    birthdate: Date.new(),
    address: '2 boulevard carnot',
    zip_code: '59000',
    city: 'Lille',
    photo: 'https://tmssl.akamaized.net/images/portrait/originals/5594-1542273058.jpg'
)



puts "create 4 ducks for user 1"

trump = create_duck(simon, "https://papermilkdesign.com/images/donald-duck-clipart-trump-16.jpg", "Flying duck")
fly = create_duck(simon, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTursMUR7DTLIIbYksfBisOadxfD-k5sfS2tplx4GOYZBtpq6pq", "ZE duck")
baby = create_duck(simon, "https://steamuserimages-a.akamaihd.net/ugc/939434973168766379/D1167147811884D24C9435D5D5C784132B412209/", "Baby love")
tasty = create_duck(simon, "https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Ffac.2F2018.2F07.2F30.2Fc59bd4cd-4f02-43e3-a450-360e224dfc87.2Ejpeg/748x372/quality/80/crop-from/center/magret-de-canard-aux-pommes.jpeg", "Tasy duck")

create_duck(moritz, "https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Ffac.2F2018.2F07.2F30.2Fc59bd4cd-4f02-43e3-a450-360e224dfc87.2Ejpeg/748x372/quality/80/crop-from/center/magret-de-canard-aux-pommes.jpeg", "Tasy duck")
create_duck(moritz, "https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Ffac.2F2018.2F07.2F30.2Fc59bd4cd-4f02-43e3-a450-360e224dfc87.2Ejpeg/748x372/quality/80/crop-from/center/magret-de-canard-aux-pommes.jpeg", "Tasy duck")
create_duck(moritz, "https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Ffac.2F2018.2F07.2F30.2Fc59bd4cd-4f02-43e3-a450-360e224dfc87.2Ejpeg/748x372/quality/80/crop-from/center/magret-de-canard-aux-pommes.jpeg", "Tasy duck")


puts "Create Reviews"

create_booking("pending", simon, moritz.ducks.first)
create_booking("accepted", simon, moritz.ducks[1])
create_booking("refused", simon, moritz.ducks.last)


puts "Je cree de sreviews"
puts "---------------------------"

10.times do
  p moritz
  p fly

  p b = create_booking("accepted", moritz, fly)
  p b
  puts ""
  create_review(b, rand(3..5))
end

10.times do
  b = create_booking("accepted", moritz, trump)
  create_review(b, rand(4..5))
end

10.times do
  b = create_booking("accepted", moritz, baby)
  create_review(b, rand(2..5))
end




# bookings = Booking.all

# bookings.each do |booking|
#     Review.create!(
#         booking: booking,
#         content: Faker::Lorem.sentences(number: 1),
#         stars: (rand()*5).round()
#     )
# end




# status = ['pending', 'refused', 'accepted']

# @bookings_counter = 0

# users.each do |user|

#     size = ((user.ducks.size) / 2).round()

#     count = 0
#     size.times do
#     dates = create_rand_start_end_dates((rand()*21 + 1).round)
#         (rand()*5 + 1).round().times do
#             Booking.create!(
#                 user: user,
#                 duck: user.ducks[count],
#                 start: dates[:start],
#                 end: dates[:end],
#                 status: status[rand()*status.size]
#             )
#             @bookings_counter += 1
#         end
#        count += 1
#     end
# end


# # REVIEWS SEEDS ===============================

# bookings = Booking.all

# bookings.each do |booking|
#     Review.create!(
#         booking: booking,
#         content: Faker::Lorem.sentences(number: 1),
#         stars: (rand()*5).round()
#     )
# end

# sexs = ['Male', 'Female']
# rand_i_races = (rand() * races.size - 1).round
# rand_i_sexs = (rand() * sexs.size - 1).round

# # create 4 ducks for user 1
# 4.times do
#     Duck.create!(
#         birthdate: Date.new(),
#         name: Faker::Creature::Animal.name,
#         race: races[rand_i_races],
#         sex: sexs[rand_i_sexs],
#         colour: Faker::Color.color_name,
#         weight: (rand() * 50 + 10).round,
#         tags: "cool,funny,noisy,smiling",
#         user: user1
#     )
# end

# # create 2 ducks for user2
# 2.times do
#     Duck.create!(
#         birthdate: Date.new(),
#         name: Faker::Creature::Animal.name,
#         race: races[rand_i_races],
#         sex: sexs[rand_i_sexs],
#         colour: Faker::Color.color_name,
#         weight: (rand() * 50 + 10).round,
#         tags: "cool,funny,noisy,smiling",
#         user: user2
#     )
# end

# # create 6 ducks for user3

# 6.times do
#     Duck.create!(
#         birthdate: Date.new(),
#         name: Faker::Creature::Animal.name,
#         race: races[rand_i_races],
#         sex: sexs[rand_i_sexs],
#         colour: Faker::Color.color_name,
#         weight: (rand() * 50 + 10).round,
#         tags: "cool,funny,noisy,smiling",
#         user: user3
#     )
# end

# # create 10 ducks for user4

# 10.times do
#     d = Duck.new(
#         birthdate: Date.new(),
#         name: Faker::Creature::Animal.name,
#         race: races[rand_i_races],
#         sex: sexs[rand_i_sexs],
#         colour: Faker::Color.color_name,
#         weight: (rand() * 50 + 10).round,
#         tags: "cool,funny,noisy,smiling",
#         user: user4
#     )

#     d.remote_photo_url = "https://picsum.photos/200/300"
#     d.save!
# end


# SEEDS DUCKS PHOTOS =========================================

# get all users to get all ducks
# for each duck, we create a new duckphoto

# CLOUDINARY SEED

# url = "https://upload.wikimedia.org/wikipedia/commons/a/a1/Mallard2.jpg"
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

moritz = User.find_by(first_name: 'moritz')
simon = User.find_by(first_name: 'simon')

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


