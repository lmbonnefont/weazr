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

campaign1 = {
  start: "12/09/2017",
  end: "11/12/2017",
  budget_total: "1000",
  budget_remaining: "26",
  post_msg: "Et si vous testiez le meilleur de la bouffe parisienne ? Vos papilles méritent mieux que ce que vous offrent les services de livraison traditionnels.
  Goûtez à l'incroyable, faites confiance à Kibouftou.",
  post_title: "Kibouftou",
  title: "Christmas Campaign",
  cpm: "13,99",
  cpc: "0.12",
  post_engagements: "154",
  btn_click: "9",
  impressions: "618",
  active: false,
}

campaign2 = {
  start: "12/12/2017",
  end: "16/12/2017",
  budget_total: "1000",
  budget_remaining: "122",
  post_msg: "Testez le plus exclusif des chocolats, par le chef Igor Sakhafarine. Seulement et exclusivement chez Kibouftou.",
  post_title: "Envie de nouveauté ?",
  title: "December Specials",
  cpm: "14,59",
  cpc: "0.22",
  post_engagements: "121",
  btn_click: "4",
  impressions: "429",
  active: false,
}

k_user = User.new(k_user)
campaign1 = Campaign.new(campaign1)
campaign2 = Campaign.new(campaign2)
kibouftou = Company.new(kibouftou)
k_dash = Dashboard.new

kibouftou.user = k_user
kibouftou.dashboard = k_dash
kibouftou.economic_sector = es
campaign1.company = kibouftou
campaign2.company = kibouftou

user_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/djjgseim9m0c3ssjqmim.jpg"
company_url =  "http://res.cloudinary.com/dezbvo9h2/image/upload/v1513089928/kibouftou_kazfqf.png"
campaign1_url = "http://res.cloudinary.com/dezbvo9h2/image/upload/v1513089951/24883602_1919847041668192_4831931305905943121_o_uhrdsu.png"
campaign2_url = 'https://www.cellublue.com/blog/wp-content/uploads/2015/01/chocolat.jpg'
k_user.remote_photo_url = user_url
kibouftou.remote_photo_url = company_url
campaign1.remote_photo_url = campaign1_url
campaign2.remote_photo_url = campaign2_url

k_user.save!
kibouftou.save!
k_dash.save!
campaign1.save!
campaign2.save!

p campaign1
p campaign2

###########################
