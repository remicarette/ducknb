# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RACES = [
    'Canard de Pékin',
    'Canard de Rouen',
    'Coureur Indien',
    'Canard Huppé',
    'Canard de Saxe',
    'Abacot Ranger',
    'Canard Mignon',
    'Arlequin Gallois']

SEXS = ['Male', 'Female']


def create_user(name, address, zip_code, city, photo)

  user = User.create!(
    first_name: "#{name}",
    last_name: 'chretien',
    email: "#{name}@ducknb.com",
    password: 'azerty',
    birthdate: Date.new(),
    address: '2 avenue des saules',
    zip_code: '59000',
    city: 'Lille',
    photo: 'https://ca.slack-edge.com/T02NE0241-UL7B9TJRW-8ac16206f4ef-48'
  )
  return User.last

end


def create_duck(owner, name, price, url)

  d = Duck.new(
    birthdate: Date.new(),
    name: name,
    race: RACES[(rand() * RACES.size - 1).round],
    sex: SEXS[(rand() * SEXS.size - 1).round],
    colour: Faker::Color.color_name,
    weight: (rand() * 50 + 10).round,
    tags: "cool,funny,noisy,smiling",
    price: price,
    user: owner
  )
  d.remote_photo_url = url
  d.save!
  return d
end

def create_booking(status, user, duck)

  b = Booking.create!(
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

def create_rand_start_end_dates(duration)
    year = 2019
    month = (rand() * 11 + 1).round
    day = (rand() * 27 + 1).round
    date = Date.parse("#{year}-#{month}-#{day}")
    dates = { start: date, end: date+duration }
end

puts "destroy_all"
User.destroy_all


print " ------------------ CREATE USERS :"

# def create_user(name, address, zip_code, city, photo)

simon = create_user('simon', '2 avenue des saules', '59000', 'Lille', 'https://ca.slack-edge.com/T02NE0241-UL7B9TJRW-8ac16206f4ef-48')
moritz = create_user('moritz', '20 boulevard de la liberté', '59000', 'Lille', 'https://ca.slack-edge.com/T02NE0241-UL7BFB5QQ-0a2dc0a5ae19-48')
franck = create_user('franck', '2 boulevard carnot', '59800', 'Lille', 'https://tmssl.akamaized.net/images/portrait/originals/5594-1542273058.jpg')

puts " #{User.count} CREATED ------------ "

print " ------------------ CREATE DUCKS :"

# def create_duck(owner, name, price, url)

trump = create_duck(simon, "Trump is back", 20.30, "https://papermilkdesign.com/images/donald-duck-clipart-trump-16.jpg")
fly = create_duck(simon, "Flying duck", 300, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTursMUR7DTLIIbYksfBisOadxfD-k5sfS2tplx4GOYZBtpq6pq")
baby = create_duck(simon, "Baby love", 5, "https://steamuserimages-a.akamaihd.net/ugc/939434973168766379/D1167147811884D24C9435D5D5C784132B412209/")
tasty = create_duck(simon, "Tasy duck", 25.99, "https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Ffac.2F2018.2F07.2F30.2Fc59bd4cd-4f02-43e3-a450-360e224dfc87.2Ejpeg/748x372/quality/80/crop-from/center/magret-de-canard-aux-pommes.jpeg")

create_duck(moritz, "Bikini duck", 89, "https://www.hotspringworld.co.uk/wp-content/uploads/2019/05/Bikini-Duck.jpg")
create_duck(moritz, "Banana duck", 32, "https://i.kym-cdn.com/photos/images/original/001/248/525/3e4.jpg")
create_duck(moritz, "Escort duck", 132, "https://thenypost.files.wordpress.com/2017/05/ducks2.jpg?quality=90&strip=all")

puts " #{Duck.count} CREATED ------------ "


print " ------------------ CREATE BOOKINGS :"

# def create_booking(status, user, duck)

create_booking("pending", simon, moritz.ducks.first)
create_booking("accepted", simon, moritz.ducks[1])
create_booking("refused", simon, moritz.ducks.last)

puts " #{Booking.count} CREATED --------------------- "


puts " ------------------ CREATE BOOKINGS & REVIEWS --------------- "

# def create_review(booking, stars)


5.times do
  b = create_booking("accepted", moritz, fly)
  create_review(b, rand(3..5))
end

5.times do
  b = create_booking("accepted", moritz, trump)
  create_review(b, rand(4..5))
end

5.times do
  b = create_booking("accepted", moritz, baby)
  create_review(b, rand(2..5))
end

puts " ------------------ #{Booking.count} BOOKINGS CREATED --------------- "
puts " ------------------ #{Review.count} REVIEWS CREATED --------------- "

# SEEDS TEST =================================

# puts "Users created : #{User.count}/4"
# puts "Ducks created : #{Duck.count}/22"
# puts "Ducks photos created : #{DuckPhoto.count}/22"
# puts "Bookings created : #{Booking.count}/#{@bookings_counter}"
# puts "Reviews created: #{Review.count}/#{Booking.count}"

# moritz = User.find_by(first_name: 'moritz')
# simon = User.find_by(first_name: 'simon')

# puts ""
# puts moritz.first_name
# puts "Ducks created : #{moritz.ducks.size}/6"
# puts "Ducks photos created : #{moritz.duck_photos.size}/6"
# puts "Bookings : #{moritz.bookings.size}"
# puts "Ducks reviews : #{moritz.reviews.size}"


# puts ""
# puts simon.first_name
# puts "Ducks created : #{simon.ducks.size}/4"
# puts "Ducks photos created : #{simon.duck_photos.size}/4"
# puts "Bookings : #{simon.bookings.size}"
# puts "Ducks reviews : #{simon.reviews.size}"


