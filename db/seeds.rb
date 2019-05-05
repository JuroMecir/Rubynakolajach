=begin
100000.times do |n|
  name  = Faker::Name.first_name
  surname = Faker::Name.last_name
  age = Faker::Number.between(0, 120)
  email = "generating-#{n+1}@jurovprojekt.org"
  password = "heslo1"
  User.create!(name:  name,
               surname: surname,
               age: age,
               email: email,
               password: password)

end


users = User.order(:created_at).take(1000)
5.times do
  size = Faker::Number.between(0, 120)
  weight = Faker::Number.between(0, 120)
  fish_id = Faker::Number.between(0, 120) % 3 +1
  time_id = Faker::Number.between(0, 120) % 3 +1
  bait_id = Faker::Number.between(0, 120) % 3 +1
  method_id = 1
  area_id = 1
  users.each { |user| user.catches.create!(size: size,
                                           weight: weight,
                                           fish_id_id: fish_id,
                                           time_id_id: time_id,
                                           bait_id_id: bait_id,
                                           method_id_id: method_id,
                                           area_id: area_id) }
end


=end

100.times do |n|
  p =Province.create!(name: Faker::Address.country)
  #District.create!(name: Faker::Address.city, province_id: Faker::Number.between(1, 99))
  #Area.create!(name: Faker::Address.city, number: Faker::Number.between(1000000, 9999999),acreage: Faker::Number.between(100, 999999), owner: Faker::Number.between(1, 99))
  #Owner.create!(name: Faker::Name.name, distrsict: Faker::Number.between(1, 99))
  Bait.create!(name: Faker::Food.dish)
  Fish.create!(name: Faker::Games::Witcher.monster)
  Methodf.create!(name: Faker::Science.element)
  pp = p.districts.create!(name: Faker::Address.city)
  ppp= pp.owners.create!(name: Faker::Address.city)
  ppp.areas.create!(name: Faker::Address.city, number: Faker::Number.between(1000000, 9999999),acreage: Faker::Number.between(100, 999999))
end
