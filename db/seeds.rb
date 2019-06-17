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



require 'open-uri'
require 'nokogiri'






=end




def search_r(query)
  i=1
  while i < 30 do
    search_html = open("https://www.kamnaryby.sk/kategoria/#{query}&page=#{i}").read
    doc = Nokogiri::HTML(search_html)
    #puts (doc)
    puts ('parsujem?\n')
    doc.search(' h2 > a').map do |movie_link|
      process_r("https://www.kamnaryby.sk#{movie_link[:href]}").to_s
      #puts(movie_link)
    end
    i = i+1
  end
end

def process_r(link)
  doc = Nokogiri::HTML(open(link))

  name = doc.search('div[class="revir-jeden"] div[class="nazov"]').first.text.strip
  humus = doc.search('table[class="table info-revir table-hover"]').first.text.strip
  # meno reviru sak preco ne
  name.slice!"Revír"
  i = 0
  revir = ''
  while name[i] != '|'
    revir = revir+name[i]
    i = i+1
  end
  #
  humus.slice!"Číslo revíru:"
  humus.strip!
  i = 0
  cislor = ''
  while humus[i] != "\n"
    if humus[i] == 'R'
      cislor = ''
      humus[i] = ' '
    else
      cislor = cislor+humus[i]
      humus[i] = ' '
      i = i+1
    end
  end

  humus.strip!
  humus.slice!"Rozloha:"
  humus.slice!"ozloha:"
  humus.strip!
  i = 0
  rozloha = ''
  while humus[i] != "\n"
    rozloha = rozloha+humus[i]
    humus[i] = ' '
    i = i+1
  end
  rozloha.slice!"\n"

  humus.strip!
  humus.slice!"Organizácia:"
  humus.strip!
  i = 0
  vlastnik = ''
  while humus[i] != "\n"
    vlastnik = vlastnik+humus[i]
    humus[i] = ' '
    i = i+1
  end

  # puts(humus)
  if cislor != nil
    cislor.strip!
  end
  if rozloha != nil
    rozloha.strip!
  end
  if revir == nil
    revir = '0'
  end
  puts(' nazov reviru:' + revir + '   cislo reviru:' + cislor + '   rozloha reviru:' + rozloha + '  vlastnik: ' + vlastnik )
  Area.create!(name: revir, number: cislor, acreage: rozloha, owner: vlastnik, region: 'Trenčiansky kraj' )
end

search_r('trenciansky-kraj')




