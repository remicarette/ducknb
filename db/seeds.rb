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
    email: 'simon@test.com',
    password: 'azerty',
    birthdate: Date.new(),
    address: '2 avenue des saules',
    zip_code: '59000',
    city: 'Lille',
    photo: 'https://picsum.photos/id/237/200/200'
)


user2 = User.create!( 
    first_name: 'renald',
    last_name: 'HB',
    email: 'renald@test.com',
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
    email: 'moritzd@test.com',
    password: 'azerty',
    birthdate: Date.new(),
    address: '20 boulevard de la liberté',
    zip_code: '59000',
    city: 'Lille',
    photo: 'https://picsum.photos/id/237/250/300'
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

# SEEDS DUCKS PHOTOS =========================================

users = User.all

users.each do |user|
    count = 1
    
    user.ducks.each do |duck| 
        DuckPhoto.create!(
            duck: duck,
            url: "https://picsum.photos/200/300?random=#{count}",
            name: Faker::FunnyName.name
        )
        count += 1 
    end
end




puts "Users created : #{User.count}"
puts "Ducks created : #{Duck.count}"
puts "Ducks photos created : #{DuckPhoto.count}"

renald = User.find_by(first_name: 'renald')
moritz = User.find_by(first_name: 'moritz')
simon = User.find_by(first_name: 'simon')

# puts "User 1, ducks created : #{User.where(first_name: 'renald')}"
puts "Renald"
puts "Ducks created : #{renald.ducks.size}"
puts ""
puts "Moritz"
puts "Ducks created : #{moritz.ducks.size}"
puts ""
puts "Simon"
puts "Ducks created : #{simon.ducks.size}"
puts "Ducks photos created : #{simon.duck_photos.size}"

