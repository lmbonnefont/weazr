# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
}

company_2 = {
  address: "12 rue de Tocqueville",
  name: "Chez Popaul",
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

######## KIBOUFTOU ########
k_user = {
  email: "jeanb@gmail.fr",
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
  pixel_id: '467837863611941'
}

k_user = User.create!(k_user)
kibouftou = Company.new(kibouftou)
k_dash = Dashboard.new

kibouftou.user = k_user
kibouftou.dashboard = k_dash
kibouftou.economic_sector = es
kibouftou.save!
k_dash.save!
###########################
