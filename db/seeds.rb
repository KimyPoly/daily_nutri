require_relative 'api'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
api = Api.new
offset = 0
4.times do
  offset += 25
  api.search_meals(offset)
end

return

User.create!(
  first_name: "Canelo",
  last_name: "Alvarez",
  age: "18",
  email: "canelo@lewagon.fr",
  password: "123456"
)

User.create!(
  first_name: "Mike",
  last_name: "Tyson",
  age: "20",
  email: "tyson@lewagon.fr",
  password: "123456"
)

User.create!(
  first_name: "Cassius",
  last_name: "Clay",
  age: "25",
  email: "clay@lewagon.fr",
  password: "123456"
)

User.create!(
  first_name: "Mohamed",
  last_name: "Ali",
  age: "28",
  email: "ali@lewagon.fr",
  password: "123456"
)
