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


def create_user(name, password, address, zip_code, city, photo)

  user = User.create!(
    first_name: "#{name}",
    last_name: 'chretien',
    email: "#{name}@ducknb.com",
    password: password,
    birthdate: Date.new(),
    address: '2 avenue des saules',
    zip_code: '59000',
    city: 'Lille',
    photo: photo
  )
  return User.last

end


def create_duck(owner, name, price, url)

  d = Duck.new(
    birthdate: Date.today,
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

def create_booking(status, user, duck, counter)

  b = Booking.create!(
    user: user,
    duck: duck,
    start: Date.today() -  850 + counter ,
    end: Date.today() -850 + counter + 9,
    status: status
    )
  return Booking.last
end

def create_review(booking, stars)
  contents = [
    "Incroyable moment avec ce joli canard !",
    "Good duck, even heavier than in the description - I recommend!",
    "Magnifique duck experience :)","Un canard normal, pas de problemes.",
    "On a passé un super week-end avec lui. Tres gentil, ce canard !",
    "Elle a meme pondu des oeufs et on en a fait une omelett savoureuse !",
    "Merci pour ton canard ! J'ai passé un bon weekend !",
    "Au festival du canard, il a fait un tabac",
    "A prendre avec soit pour le festival",
    "Recommandé par Maurice, au top !!",
    "Ce canard a embelli ma journée !!",
    "Lovely duck !",
    "What a nice duck !",
    "Nice duck bro ! Thanks !",
    "I was happy with my duck !",
    "Ce n'était pas vraiment la couleur que je souhaitais",
    "Un peu énervé mais sympathique !",
    "J'aurai aimé avoir un autre canard",
    "La prochaine fois, je prends son petit frère",
    "Merci mon ami pour ton canard",
    "Mon canard s'est bien entendu avec l'es*** de PAB",
    "Vivement un guitare canard",
    "Je l'ai loué pour aller sur mon île privé !"]
  Review.create!(
    booking: booking,
    content: contents[rand(0..contents.size - 1)],
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

simon = create_user('simon', 'azerty', '2 avenue des saules', '59000', 'Lille', 'https://ca.slack-edge.com/T02NE0241-UL7B9TJRW-8ac16206f4ef-48')
moritz = create_user('moritz', 'qwertz', '20 boulevard de la liberté', '59000', 'Lille', 'https://ca.slack-edge.com/T02NE0241-UL7BFB5QQ-0a2dc0a5ae19-48')
franck = create_user('franck', 'azerty', '2 boulevard carnot', '59800', 'Lille', 'https://tmssl.akamaized.net/images/portrait/originals/5594-1542273058.jpg')
remi =  create_user('remi', 'azerty', '24 Rue Holbach', '59800', 'Lille', 'https://ca.slack-edge.com/T02NE0241-UL79224P2-7a94c0d24580-72')
pab =  create_user('pab', 'azerty', '287 Rue Léon Gambetta', '59800', 'Lille', 'https://ca.slack-edge.com/T02NE0241-UL0U0N3NV-f7cb9889f0c7-72')
nico =  create_user('nico', 'azerty', '78 Rue Alphonse Mercier', '59800', 'Lille', 'https://ca.slack-edge.com/T02NE0241-UL7JFQ0R3-3696ceb54c45-72')



puts " #{User.count} CREATED ------------ "

print " ------------------ CREATE DUCKS :"

# def create_duck(owner, name, price, url)

donald = create_duck(simon, "Donald Duck", 20.30, "https://images.unsplash.com/photo-1513173125192-da282c9a64ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2216&q=80")
flagada = create_duck(simon, "Flagada Jones", 10.6, "https://images.unsplash.com/photo-1553990442-d0feffedba37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80")
picsou = create_duck(franck, "Picsou", 5.30, "https://images.unsplash.com/photo-1506847345862-ea1bf8c39bf1?ixlib=rb-1.2.1&auto=format&fit=crop&w=3300&q=80")
fifi = create_duck(franck, "Fifi", 8.12, "https://images.unsplash.com/photo-1519654182165-40c92a46967c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2255&q=80")
loulou = create_duck(remi, "Loulou", 40.16, "https://images.unsplash.com/photo-1555782722-0fa018023500?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80")
riri = create_duck(remi, "Riri", 20.30, "https://images.unsplash.com/photo-1521730365094-d6978fa2ac8d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60")
gontran = create_duck(pab, "Gontran Bonheur", 19.40, "https://www.outfox-world.de/_Resources/Persistent/09bff8a5360ba5ca46cd89dd6dd2a30783cb8562/duck-1486716_1920%20Kopie-1920x989-880x453.jpg")
elvire = create_duck(pab, "Elvire Ecoutum", 20.30, "https://1.bp.blogspot.com/-DCXxQj7NuN4/W-VsE4PcHoI/AAAAAAAAwr4/EH7m4cNDFcIrUEOqaa7sX-XIACvE0zK-ACLcBGAs/s1600/Humanface5.jpg")
popop = create_duck(nico, "Popop Duck", 20.10, "https://www.servus.com/tachyon/sites/4/2018/06/FO-1W27XJVDS5N11-stv_cover_landscape-3.jpg?resize=1200,675&crop_strategy=smart")
della = create_duck(nico, "Della Duck", 30.12, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTursMUR7DTLIIbYksfBisOadxfD-k5sfS2tplx4GOYZBtpq6pq")
lulubelle = create_duck(moritz, "Lulubelle Louft", 5, "https://steamuserimages-a.akamaihd.net/ugc/939434973168766379/D1167147811884D24C9435D5D5C784132B412209/")
tasty = create_duck(moritz, "Archibald Gripsou", 25.99, "https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Ffac.2F2018.2F07.2F30.2Fc59bd4cd-4f02-43e3-a450-360e224dfc87.2Ejpeg/748x372/quality/80/crop-from/center/magret-de-canard-aux-pommes.jpeg")
# create_duck(moritz, "Royal duck", 53000, "https://images.pexels.com/photos/1362013/pexels-photo-1362013.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
# create_duck(moritz, "Bikini duck", 89, "https://www.hotspringworld.co.uk/wp-content/uploads/2019/05/Bikini-Duck.jpg")
# create_duck(moritz, "Banana duck", 32, "https://i.kym-cdn.com/photos/images/original/001/248/525/3e4.jpg")
# create_duck(moritz, "Escort duck", 132, "https://thenypost.files.wordpress.com/2017/05/ducks2.jpg?quality=90&strip=all")


puts " #{Duck.count} CREATED ------------ "


print " ------------------ CREATE BOOKINGS :"

# def create_booking(status, user, duck)

Duck.all.each do |duck|
  users = [simon, moritz, remi, pab, nico, franck]
  users.delete(duck.user)
  counter = 0
  rand(12..18).times do
    b =  create_booking("accepted", users[rand(0..(users.size) -1)], duck, counter)
      create_review(b, rand(1..5))
      counter += 11
  end
  1.times do
    b =  create_booking("pending",users[rand(0..(users.size) -1)], duck, counter)
    counter += 11
  end
  5.times do
    b =  create_booking("refused",users[rand(0..(users.size) -1)], duck, counter)
    counter += 11
  end

end
# create_booking("pending", simon, moritz.ducks.first)
# create_booking("accepted", simon, moritz.ducks[1])
# create_booking("refused", simon, moritz.ducks.last)

puts " #{Booking.count} CREATED --------------------- "


puts " ------------------ CREATE BOOKINGS & REVIEWS --------------- "

# def create_review(booking, stars)


# 5.times do
#   b = create_booking("accepted", moritz, fly)
#   create_review(b, rand(3..5))
# end
#
# 5.times do
#   b = create_booking("accepted", moritz, trump)
#   create_review(b, rand(4..5))
# end
#
# 5.times do
#   b = create_booking("accepted", moritz, baby)
#   create_review(b, rand(2..5))
# end

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
