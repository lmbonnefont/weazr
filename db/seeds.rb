# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Meteo.destroy_all
Dashboard.destroy_all
Input.destroy_all
User.destroy_all
Company.destroy_all
Campaign.destroy_all
CampaignDay.destroy_all

user_1 = {
  email: "loulou@gemlejambon.fr",
  password: 123456,
}

user_2 = {
  email: "aurel@yolo.fr",
  password: 123456,
}

company_1 = {
  address: "27 rue saint louis",
  name: "Chez Tinou",
  website_url: 'https://aurel-allard.github.io/Kibouftou-Landing/',
}

company_2 = {
  address: "12 rue de Tocqueville",
  name: "Chez Popaul",
  website_url: 'https://aurel-allard.github.io/Kibouftou-Landing/',
}

input_1 = {
  monday: 0.1,
  tuesday: 0.2,
  wednesday: 0.1,
  thursday: 0.1,
  friday: 0.2,
  saturday: 0.2,
  sunday: 0.1,
}

input_2 = {
  monday: 0.3,
  tuesday: 0,
  wednesday: 0.1,
  thursday: 0.1,
  friday: 0.2,
  saturday: 0.2,
  sunday: 0.1,
}

inputs = [input_1, input_2]
companies = [company_1, company_2]
users = [user_1, user_2]


economic_sector1 = {
  name: "Food Delivery",
  damp: 0.2,
  temperature: -0.2,
  rain: 0.6,
}


es = EconomicSector.create(economic_sector1)

users.each_with_index do |user, index|

  u = User.create!(users[index])

  c = Company.new(companies[index])
  c.user = u
  c.economic_sector = es
  p c
  c.save!

  d = Dashboard.create!(company_id: c.id)


  i = Input.new(inputs[index])
  i.company_id = c.id
  i.save!


end

for i in (0..14) do
  m = Meteo.new
  m.date = Date.today + i
  m.save!
end

######## KIBOUFTOU ########
k_user = {
  email: "jeanb@gmail.com",
  password: 123456,
  first_name: "Jean",
  last_name: "Bombeur",
  phone_number: '02.40.35.69.18',
}

kibouftou = {
  address: "16 Villa Gaudelet",
  name: "Kibouftou",
  account_id: 'act_114566172663449',
  page_id: '1917026111950285',
  website_url: 'https://aurel-allard.github.io/Kibouftou-Landing/',
  pixel_id: '467837863611941',
}

k_inputs = {
  monday: 0.10,
  tuesday: 0.10,
  wednesday: 0.10,
  thursday: 0.14,
  friday: 0.18,
  saturday: 0.21,
  sunday: 0.17,
}

campaign1 = {
  start: "15/11/2017",
  end: "02/12/2017",
  budget_total: "50000",
  budget_remaining: "0",
  post_msg: "Et si vous testiez le meilleur de la bouffe parisienne ? Vos papilles méritent mieux que ce que vous offrent les services de livraison traditionnels.
  Goûtez à l'incroyable, faites confiance à Kibouftou.",
  post_title: "Kibouftou",
  title: "Lauching New",
  cpm: "13,99",
  cpc: "0.12",
  post_engagements: "1543",
  btn_click: "29",
  impressions: "6186",
  active: false,
}

campaign2 = {
  start: "17/11/2017",
  end: "28/11/2017",
  budget_total: "95000",
  budget_remaining: "0",
  post_msg: "Testez le plus exclusif des chocolats, par le chef Igor Sakhafarine. Seulement et exclusivement chez Kibouftou.",
  post_title: "Envie de nouveauté ?",
  title: "November Specials",
  cpm: "14,59",
  cpc: "0.22",
  post_engagements: "1212",
  btn_click: "55",
  impressions: "4299",
  active: false,
}

campaign3 = {
  start: "26/11/2017",
  end: "10/12/2017",
  budget_total: "75000",
  budget_remaining: "1200",
  post_msg: "Pour célébrer la bonne nouvelle, NOUS VOUS OFFRONS 5 REPAS POUR 2 PERSONNES, d'une valeur de 60€.
Pour participer, taguez en commentaire l'heureux élu avec qui vous souhaitez partager ce délicieux repas, les gagnants seront alors tirés au sort.",
  post_title: "Concours",
  title: "FoodBet",
  cpm: "14,32",
  cpc: "0.31",
  post_engagements: "769",
  btn_click: "42",
  impressions: "2225",
  active: false,
}

campaign4 = {
  start: "06/12/2017",
  end: "14/12/2017",
  budget_total: "78000",
  budget_remaining: "1290",
  post_msg: "Faites le plein des plus délicieux fruits de mer avant Noël. Un petit goût iodé dans votre bouche pour votre plus grand plaisir. Reprenez le contrôle de la paëlla.",
  post_title: "Des moules bien fraiches ? Paëlla !",
  title: "Sea Time",
  cpm: "18,23",
  cpc: "0.25",
  post_engagements: "1848",
  btn_click: "212",
  impressions: "5395",
  active: false,
}

k_user = User.new(k_user)
kibouftou = Company.new(kibouftou)
k_inputs = Input.new(k_inputs)
campaign1 = Campaign.new(campaign1)
campaign2 = Campaign.new(campaign2)
campaign3 = Campaign.new(campaign3)
campaign4 = Campaign.new(campaign4)
k_dash = Dashboard.new

kibouftou.user = k_user
kibouftou.dashboard = k_dash
kibouftou.economic_sector = es
kibouftou.input = k_inputs
campaign1.company = kibouftou
campaign2.company = kibouftou
campaign3.company = kibouftou
campaign4.company = kibouftou

user_url = "https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/3/005/0a2/2d6/17a7192.jpg"
company_url =  "http://res.cloudinary.com/dezbvo9h2/image/upload/v1513089928/kibouftou_kazfqf.png"
campaign1_url = "http://res.cloudinary.com/dezbvo9h2/image/upload/v1513089951/24883602_1919847041668192_4831931305905943121_o_uhrdsu.png"
campaign2_url = 'http://s1.lemde.fr/mmpub/edt/zip/2017/06/01/155215730-9ecf701879dcd9c76d77f84828f52a711ec691b1/images/t05.jpg'
campaign3_url = 'https://oneclassblog.com/wp-content/uploads/2017/10/food.jpg'
campaign4_url = 'https://image.afcdn.com/recipe/20150617/67073_w1024h768c1cx362cy241.jpg'
k_user.remote_photo_url = user_url
kibouftou.remote_photo_url = company_url
campaign1.remote_photo_url = campaign1_url
campaign2.remote_photo_url = campaign2_url
campaign3.remote_photo_url = campaign3_url
campaign4.remote_photo_url = campaign4_url

k_user.save!
k_inputs.save!
kibouftou.save!
k_dash.save!
campaign1.save!
campaign2.save!
campaign3.save!
campaign4.save!

p campaign1
p campaign2
p campaign3
p campaign4

###########################
