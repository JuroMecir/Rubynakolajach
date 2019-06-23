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


Fish.create!(name: "Boleň dravý")
Fish.create!(name: "Hlavátka podunajská")
Fish.create!(name: "Jalec hlavatý")
Fish.create!(name: "Jalec maloústy")
Fish.create!(name: "Jalec tmavý")
Fish.create!(name: "Jeseter malý")
Fish.create!(name: "Kapor rybničný")
Fish.create!(name: "Lieň sliznatý")
Fish.create!(name: "Lipeň tymianový")
Fish.create!(name: "Mieň sladkovodný")
Fish.create!(name: "Mrena severná")
Fish.create!(name: "Mrena škvrnitá")
Fish.create!(name: "Nosáľ sťahovavý")
Fish.create!(name: "Pleskáč siný")
Fish.create!(name: "Pleskáč tuponosý")
Fish.create!(name: "Pleskáč vysoký")
Fish.create!(name: "Podustva severná")
Fish.create!(name: "Pstruh dúhový")
Fish.create!(name: "Pstruh jazerný")
Fish.create!(name: "Pstruh potočný")
Fish.create!(name: "Sivoň potočný")
Fish.create!(name: "Sumec veľký")
Fish.create!(name: "Šťuka severná")
Fish.create!(name: "Zubáč veľkoústy")
Fish.create!(name: "Zubáč volžský")
Fish.create!(name: "Amur biely")
Fish.create!(name: "Sih maréna")
Fish.create!(name: "Sih peleď")
Fish.create!(name: "Tolstolobik")
Fish.create!(name: "Úhor európsky")
Fish.create!(name: "Hlaváč bieloplutvý")
Fish.create!(name: "Hlaváč pásoplutvý")




Methodf.create!(name: "Plávaná")
Methodf.create!(name: "Na ťažko")
Methodf.create!(name: "Na prívlač")
Methodf.create!(name: "Feeder")
Methodf.create!(name: "Muškárenie")
Methodf.create!(name: "iné")


Bait.create!(name: "Kukurica")
Bait.create!(name: "Chleba")
Bait.create!(name: "Boilies")
Bait.create!(name: "Červ - hnojový")
Bait.create!(name: "Červ - kostný")
Bait.create!(name: "Živá rybka")
Bait.create!(name: "Mŕtva rybka")
Bait.create!(name: "Gumová rybka")
Bait.create!(name: "Blyskáč,rotačka")
Bait.create!(name: "Umelá muška")



require 'open-uri'
require 'nokogiri'











def search_r(query,label)
  i=1
  while i < 66 do
    search_html = open("https://www.kamnaryby.sk/kategoria/#{query}&page=#{i}").read
    doc = Nokogiri::HTML(search_html)
    #puts (doc)
    puts ('parsujem?\n')
    doc.search(' h2 > a').map do |movie_link|
      process_r("https://www.kamnaryby.sk#{movie_link[:href]}",label).to_s
      #puts(movie_link)
    end
    i = i+1
  end
end

def process_r(link,label)
  if link != "https://www.kamnaryby.sk/revir/strkovisko-rybník-ilava"
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
    if vlastnik == 'Účel:'
      vlastnik = 'nezadané'
    end
    puts(' nazov reviru:' + revir + '   cislo reviru:' + cislor + '   rozloha reviru:' + rozloha + '  vlastnik: ' + vlastnik )
    Area.create!(name: revir, number: cislor, acreage: rozloha, owner: vlastnik, region: label )
  end
end

search_r('kosicky-kraj', 'Košický kraj')
search_r('presovsky-kraj', 'Prešovský kraj')
search_r('banskobystricky-kraj', 'Banskobystrický kraj')
search_r('trnavsky-kraj', 'Trnavský kraj')
search_r('nitriansky-kraj', 'Nitrianský kraj')
search_r('bratislavsky-kraj', 'Bratislavský kraj')
search_r('zilinsky-kraj', 'Žilinský kraj')
search_r('trenciansky-kraj', 'Trenčiansky kraj')



100.times do |n|
  name  = Faker::Name.first_name
  surname = Faker::Name.last_name
  age = Faker::Number.between(15, 80)
  email = "generating-#{n+1}@jurovprojekt.org"
  password = "heslo1"
  User.create!(name:  name,
               surname: surname,
               age: age,
               email: email,
               password: password)
  end



#ActiveRecord::Base.connection.execute("insert into catches(user_id, area_id, fish_id, methodf_id, bait_id, size, weight, created_at, updated_at) select 1 + i%100,  Floor(random()*120) + 713, 1 +  Floor(random()*32),1 + Floor(random()*6),1 + Floor(random()*10),20 + Floor(random()*100),Floor(random()*20) +1 , now(), now() from generate_series(0,5000) s(i);")