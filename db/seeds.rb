# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

user_1 = {
  email: "loulou@gemlejambon.fr",
  password: 123456,
}

user_2 = {
  email: "aurel@yolo.fr",
  password: 123456,
}

economic_sector1 = {
  name: "Food Delivery",
  damp: 0.2,
  temperature: 0.4,
  rain: 0.4,
}

EconomicSector.create(economic_sector1)

[user_1, user_2].each do |user|
  User.create!(user)
end
