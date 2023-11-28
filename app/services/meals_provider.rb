class MealsProvider

  def initialize(options)
    @chatgpt = Chatgpt.new(options)
    @program = options[:program]
  end

  def prepare_meals
    @result = @chatgpt.search_meals
    @recipes = Parser.new(@result).parse_recipes
  end

  def save_meals(recipes)
    recipes.each do |recipe|
      clone = recipe.clone
      clone.delete(:ingredients)
      meal = Meal.new(clone)
      # meal.program = @program
      meal.save
      prepare_ingredients(recipes.ingredients, Meal.last)
    end
  end

  def prepare_ingredients(ingredients, meal)
    ingredients.each do |ingredient|
     ingr = Ingredient.new(title: ingredient)
      ingr.meal = meal
      ingr.save
    end
  end
end
