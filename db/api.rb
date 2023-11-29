require 'faraday'
require 'json'

class Api
  def initialize
    @connn = Faraday.new(
      url: 'https://api.spoonacular.com/recipes/complexSearch?&number=1&addRecipeInformation=true&addRecipeNutrition=true&apiKey=a8dc1c3728f44954911b146a8a6d120f'
    )
  end

  def test
    @connn.get('').body
  end
end

api = Api.new

JSON.parse(api.test)['results'].each do |meal|

end
diet = JSON.parse(api.test)['results'][0]["vegetarian"]
title = JSON.parse(api.test)['results'][0]["title"]
time = JSON.parse(api.test)['results'][0]["readyInMinutes"]
price = JSON.parse(api.test)['results'][0]["pricePerServing"]
image = JSON.parse(api.test)['results'][0]["image"]
calories = JSON.parse(api.test)['results'][0]["nutrition"]["nutrients"][0]["name"]
calories_amount = JSON.parse(api.test)['results'][0]["nutrition"]["nutrients"][0]["amount"]
ingredients_length = JSON.parse(api.test)['results'][0]["nutrition"]["ingredients"].length

ingredients_length.times do |i|
  ingredient_name = JSON.parse(api.test)['results'][0]["nutrition"]["ingredients"][i]["name"]
  p ingredient_name
end

ingredient1 = JSON.parse(api.test)['results'][0]["nutrition"]["ingredients"][0]["name"]
ingredient2 = JSON.parse(api.test)['results'][0]["nutrition"]["ingredients"][1]["name"]
ingredient3 = JSON.parse(api.test)['results'][0]["nutrition"]["ingredients"][2]["name"]
# loop for the given ingredients of each recipe
dish_types = JSON.parse(api.test)['results'][0]["dishTypes"].join(",")
diet = JSON.parse(api.test)['results'][0]["diets"].join(",")
# loop for the given steps of each recipe
recipe_steps_length = JSON.parse(api.test)['results'][0]["analyzedInstructions"][0]["steps"].length
recipe_steps_length.times do |i|
  step = JSON.parse(api.test)['results'][0]["analyzedInstructions"][0]["steps"][i]["step"]
  p step
end
