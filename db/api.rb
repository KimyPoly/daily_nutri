require 'faraday'
require 'json'
require 'open-uri'

class Api
  def initialize
    @conn = Faraday.new(
      url: 'https://api.spoonacular.com/recipes/complexSearch?&number=25&addRecipeInformation=true&addRecipeNutrition=true&apiKey=9bd4287b6eee44e4b1dda7d49cd153aa'
    )
  end

  def test(offset)
    @conn.get('', { offset: offset }).body
  end

  def search_meals(offset)
    JSON.parse(test(offset))['results'].each do |meal|
      next unless meal["analyzedInstructions"].length > 0

      recipe_steps_length = meal["analyzedInstructions"][0]["steps"].length
      recipe_steps = []

      recipe_steps_length.times do |i|
        step = meal["analyzedInstructions"][0]["steps"][i]["step"]
        recipe_steps << step
      end

      ingredients_length = meal["nutrition"]["ingredients"].length
      next unless ingredients_length > 0

      ingredients = []

      ingredients_length.times do |i|
        ingredient_name = meal["nutrition"]["ingredients"][i]["name"]
        ingredients << ingredient_name
      end

      next if Meal.where(name: meal["title"]).count > 0
      days_of_week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
      random_index = rand(days_of_week.length)


      meal = Meal.create!(
        name: meal["title"],
        recipe: recipe_steps.join(","),
        calories: meal["nutrition"]["nutrients"][0]["amount"],
        price: meal["pricePerServing"],
        meal_type: meal["dishTypes"].join(","),
        ingredients: ingredients.join(", "),
        time: meal["readyInMinutes"].to_i,
        diet: meal["diets"].join(","),
        day: rand(1..7),
        week_day: days_of_week[random_index],
        photo_url: meal["image"]
      )

      puts "#{meal.name} created"
    end
  end
end


# diet = JSON.parse(api.test)['results'][0]["vegetarian"]
# title = JSON.parse(api.test)['results'][0]["title"]
# time = JSON.parse(api.test)['results'][0]["readyInMinutes"]
# price = JSON.parse(api.test)['results'][0]["pricePerServing"]
# image = JSON.parse(api.test)['results'][0]["image"]
# calories_amount = JSON.parse(api.test)['results'][0]["nutrition"]["nutrients"][0]["amount"]
# ingredients_length = JSON.parse(api.test)['results'][0]["nutrition"]["ingredients"].length

# ingredients_length.times do |i|
#   ingredient_name = JSON.parse(api.test)['results'][0]["nutrition"]["ingredients"][i]["name"]
# end

# ingredient1 = JSON.parse(api.test)['results'][0]["nutrition"]["ingredients"][0]["name"]
# ingredient2 = JSON.parse(api.test)['results'][0]["nutrition"]["ingredients"][1]["name"]
# ingredient3 = JSON.parse(api.test)['results'][0]["nutrition"]["ingredients"][2]["name"]
# # loop for the given ingredients of each recipe
# dish_types = JSON.parse(api.test)['results'][0]["dishTypes"].join(",")
# diet = JSON.parse(api.test)['results'][0]["diets"].join(",")
# # loop for the given steps of each recipe
# recipe_steps_length = JSON.parse(api.test)['results'][0]["analyzedInstructions"][0]["steps"].length
# recipe_steps_length.times do |i|
#   step = JSON.parse(api.test)['results'][0]["analyzedInstructions"][0]["steps"][i]["step"]
# end
