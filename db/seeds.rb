# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

}

input_2 = {

}

companies = [company_1, company_2]
users = [user_1, user_2]

users.each_with_index do |user, index|
  u = User.create!(users[index])
  c = Company.new!(companies[index])
  c.company = u
  c.save!
end


