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




Fish.create!(name: "Asp")
Fish.create!(name: "Eel")
Fish.create!(name: "Pike")
Fish.create!(name: "Catfish")
Fish.create!(name: "Carp")
Fish.create!(name: "Chub")
Fish.create!(name: "Zander")
Fish.create!(name: "Trout")
Fish.create!(name: "Sturgeon")
Fish.create!(name: "Tench")
Fish.create!(name: "Greyling")
Fish.create!(name: "Burbot")
Fish.create!(name: "Barbus")
Fish.create!(name: "Bream")
Fish.create!(name: "Nase")
Fish.create!(name: "Charr")
Fish.create!(name: "Grass Carp")
Fish.create!(name: "Silver Carp")
Fish.create!(name: "Whitefish")
Fish.create!(name: "Danube Salmon")




Methodf.create!(name: "Float Fishing")
Methodf.create!(name: "Fly Fishing")
Methodf.create!(name: "Heavy Fishing")
Methodf.create!(name: "Jigging")


Bait.create!(name: "Corn")
Bait.create!(name: "Bread")
Bait.create!(name: "Boilies")
Bait.create!(name: "Worm")
Bait.create!(name: "Small fishes")
Bait.create!(name: "Jig")
Bait.create!(name: "Fly")
Bait.create!(name: "Twister")

=end


