
1000.times do |n|
  name  = Faker::Name.first_name
  surname = Faker::Name.last_name
  age = Faker::Number.between(0, 120)
  email = "example-#{n+1}@jurovprojekt.org"
  password = "password"
  User.create!(name:  name,
               surname: surname,
               age: age,
               email: email,
               password: password)

end