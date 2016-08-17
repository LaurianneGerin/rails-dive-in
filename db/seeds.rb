# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Availability.destroy_all
Reservation.destroy_all
PoolAnimal.destroy_all
Animal.destroy_all
Pool.destroy_all
User.destroy_all

puts "User seed begin"
10.times do
  users = User.new(first_name:Faker::Name.first_name,
                   last_name:Faker::Name.last_name,
                   email:Faker::Internet.email,
                   phone_number:Faker::PhoneNumber.phone_number,
                   password:Faker::Internet.password(8),
                   description:Faker::Lorem.paragraph)
  users.save
  print '*'
end
puts ""
puts "User seed end"


puts "animal seed begin"
10.times do
  animals = Animal.new(name:["crocodile", "dolphin", "snake", "fish", "dog"].sample)
  animals.save
  print '*'
end
puts ""
puts "animal seed end"


puts "Pool seed begin"
10.times do
  pools = Pool.new(user_id:User.all.sample.id,
                   width:rand(2..10),
                   height:rand(10..50),
                   depth:rand(3..10),
                   color:Faker::Color.color_name,
                   pool_house:Faker::Boolean.boolean,
                   pool_toys:Faker::Boolean.boolean,
                   pool_type:["olympic","buried","half-buried", "inflatable"].sample,
                   water_type:["salted", "chlorure"].sample,
                   capacity:rand(3..20),
                   description:Faker::Lorem.paragraph,
                   alcohol:Faker::Boolean.boolean,
                   soft:Faker::Boolean.boolean,
                   bbq:Faker::Boolean.boolean,
                   pool_girl:rand(2..10),
                   pool_boy:rand(2..10),
                   address:["38 Rue du Pas-Saint-Georges 33000 Bordeaux",
                            "1-6 Cours de l'Intendance Bordeaux",
                            "320 Cours de la Somme Bordeaux",
                            "72 Rue Fondaudège 33000 Bordeaux",
                            "23 Rue Huguerie 33000 Bordeaux",
                            "71 Cours d'Alsace-et-Lorraine 33000 Bordeaux",
                            "45 Avenue de la République 33000 Bordeaux",
                            "10 Cours Balguerie Stuttenberg 33000 Bordeaux",
                            "40 Rue Notre Dame 33000 Bordeaux",
                            "19 Rue Jean Jacques Rousseau 33000 Bordeaux",
                            "134 Rue François de Sourdis 33000 Bordeaux",
                            "37 Rue Esprit des Lois 33000 Bordeaux",
                            "79 Rue du Loup 33000 Bordeaux",
                            "168 Cours de l'Argonne 33000 Bordeaux",
                            "Miroir d'eau Place de la Bourse, 33000 Bordeaux"].sample,
                   remote_photos_url: ["http://res.cloudinary.com/lauriannegerin/image/upload/v1471427227/mvx8jwzws1iouomcwijz.jpg",
                                       "http://res.cloudinary.com/lauriannegerin/image/upload/v1471427221/v9sbizzimw2jkap3v5hl.jpg",
                                       "http://res.cloudinary.com/lauriannegerin/image/upload/v1471427216/nef1n983cprcp7s96l02.jpg",
                                       "http://res.cloudinary.com/lauriannegerin/image/upload/v1471427211/l4oypl3ltkzqv7eswhvq.jpg",
                                       "http://res.cloudinary.com/lauriannegerin/image/upload/v1471427207/hqnfdqtv9bsmp8ybbxe6.jpg",
                                       "http://res.cloudinary.com/lauriannegerin/image/upload/v1471427199/lmntg8byft1a4d2l07ns.jpg",
                                       "http://res.cloudinary.com/lauriannegerin/image/upload/v1471427194/qiymwneyxiuiaqzy9hvv.jpg",
                                       "http://res.cloudinary.com/lauriannegerin/image/upload/v1471427189/b2aylwfzbwbmuyzgwyeo.jpg",
                                       "http://res.cloudinary.com/lauriannegerin/image/upload/v1471427184/pkpxphw3slwowtpfgbk4.jpg",
                                       "http://res.cloudinary.com/lauriannegerin/image/upload/v1471427177/sojlfnsniimkplr0jzjp.jpg",
                                       "http://res.cloudinary.com/lauriannegerin/image/upload/v1471426462/tyeimakj0dxht336y3br.jpg"].sample
                    ].sample)
  print '*'
  pools.save
end
puts ""
puts "Pool seed end"

puts "PoolAnimal seed begin"
10.times do
  pool_animals = PoolAnimal.new(animal_id:Animal.all.sample.id,
                                quantity:rand(1..5),
                                pool_id:Pool.all.sample.id)
  pool_animals.save
  print '*'
end
puts ""
puts "PoolAnimal seed begin"

puts "Reservations seed Begin"
15.times do
  reservations = Reservation.new(pool_id:Pool.all.sample.id,
                                 user_id:User.all.sample.id,
                                 begin_date:Faker::Date.between(2.days.ago, Date.today),
                                 end_date:Faker::Date.forward(23),
                                 statut:Faker::Code.asin)
  reservations.save
  print '*'
end
puts ""
puts "Reserevations seed end"

puts "Availability seed begin"
15.times do
  availabilites = Availability.new(pool_id:Pool.all.sample.id,
                                  begin_date:Faker::Date.between(5.days.ago, Date.today),
                                  end_date:Faker::Date.forward(60))
  availabilites.save
  print '*'
end
puts ""
puts "Availability seed end"
