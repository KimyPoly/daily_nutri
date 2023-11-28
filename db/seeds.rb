# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Ingredient.delete_all
Meal.delete_all
Program.delete_all
User.delete_all

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

existing_user_ids = User.pluck(:id)

program = Program.create!(
  user_id: existing_user_ids.sample,
  goal: "weight maintenance",
  diet: "Vegan",
  allergies: "Crusta",
  nb_of_meals_by_day: 4,
  nb_of_days: 7,
  nb_of_snacks: 2,
  height: 186,
  weight: 80.5
)

# Create meals for the program directly
meal = program.meals.build(
  name: "Quinoa Salad",
  recipe: "Cook quinoa and let it cool. Mix quinoa with chopped vegetables like cucumbers, tomatoes, and bell peppers. Drizzle with olive oil and lemon juice, and season with salt and pepper.",
  day: 2,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.create([
  { name: "Quinoa" },
  { name: "Lemon" }
])

meal = program.meals.build(
  name: "Stuffed Bell Peppers",
  recipe: "Cut bell peppers in half and remove seeds.
  Fill each half with a mixture of cooked quinoa, black beans, corn, and diced tomatoes.
  Bake in the oven until peppers are tender.",
  day: 3,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build(
  name: "Peppers"
)

meal = program.meals.build(
  name: "Tofu Stir-Fry",
  recipe: "Press and cube tofu, stir-fry until golden.
  Add broccoli, bell peppers, and carrots to the pan.
  Mix in minced ginger and garlic, stir-fry until vegetables are tender.
  Season with soy sauce and serve over rice.",
  day: 4,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  { name: "Tofu" },
  { name: "Ginger" }
])

meal = program.meals.build(
  name: "Chickpea Salad",
  recipe: "Combine chickpeas with chopped cucumber, cherry tomatoes, and red onion.
  Dress with olive oil, lemon juice, and your favorite herbs.",
  day: 5,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  {name: "Tomato"},
  {name: "Oil"}
])

program =  Program.create!(
  user_id: existing_user_ids.sample,
  goal: "gain weight",
  diet: "Vegetarian",
  allergies: "Sesame",
  nb_of_meals_by_day: 3,
  nb_of_days: 6,
  nb_of_snacks: 1,
  height: 165,
  weight: 52
)

meal = program.meals.build(
  name: "Banana Oat Pancakes",
  recipe: "Mix all ingredients and cook on a hot griddle",
  day: 1,
  type_of_meal: "breakfast"
)

meal.save

meal.ingredients.build([
  {name: "Banana"},
  {name: "Salt"}
])


meal = program.meals.build(
  name: "Quinoa Chickpea Salad",
  recipe: "Combine 1 cup of cooked quinoa with a can of rinsed and drained chickpeas.
  Add assorted vegetables like cucumbers, tomatoes, and bell peppers.
  Drizzle with olive oil and lemon vinaigrette",
  day: 2,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  {name: "Quinoa"},
  {name: "lemon"}
])

meal = program.meals.build(
  name: "Dinner: Stir-Fried Tofu with Vegetable",
  recipe: "Sauté 200g of cubed tofu in a pan until golden.
  Add mixed vegetables (broccoli, carrots, mushrooms) and stir-fry until tender.
  Season with soy sauce, ginger, and garlic.",
  day: 3,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  {name: "Tofu"},
  {name: "Brocoli"}
])

meal = program.meals.build(
  name: "Protein Smoothie",
  recipe: "Blend 1 cup of plant-based milk with 1 scoop of plant-based protein powder, 1 banana, and 1 tablespoon of almond butter.
  Add ice and blend until smooth.",
  day: 4,
  type_of_meal: "breakfast"
)

meal.save

meal.ingredients.build([
  {name: "protein-powder"},
  {name: "Banana"}
])

meal = program.meals.build(
  name: "Vegetarian Burrito",
  recipe: "Fill a whole wheat tortilla with black beans, brown rice, avocado, and salsa.
  Optionally, add shredded cheese.",
  day: 5,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  {name: "black beans"},
  {name: "avocado"}
])

program.meals.build(
  name: "Lentils with Vegetables",
  recipe: "Cook 1 cup of lentils.
  Sauté mixed vegetables (peas, carrots, spinach) and mix with the lentils.
  Season with a herbed tomato sauce.",
  day: 6,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  {name: "lentils"},
  {name: "tomato sauce"}
])

program =  Program.create!(
  user_id: existing_user_ids.sample,
  goal: "lose weight",
  diet: "Omnivorous",
  allergies: "Milk",
  nb_of_meals_by_day: 3,
  nb_of_days: 7,
  nb_of_snacks: 3,
  height: 178,
  weight: 95
)

meal = program.meals.build(
  name: "Vegetable Omelette",
  recipe: "Whisk 2 eggs and pour into a heated, non-stick skillet.
  Add chopped spinach, tomatoes, and mushrooms.
  Cook until the eggs are set, then fold in half.",
  day: 1,
  type_of_meal: "breakfast"
)

meal.save

meal.ingredients.build([
  {name: "Egg"},
  {name: "Spinach"}
])


meal = program.meals.build(
  name: "Grilled Chicken Salad",
  recipe: "Grill chicken breast with your favorite seasonings.
  Toss lettuce, cucumbers, and peppers in a bowl.
  Top with grilled chicken and drizzle with olive oil and lemon vinaigrette.",
  day: 2,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  {name: "Chicken"},
  {name: "Cucumber"}
])

program.meals.build(
  name: "Baked Salmon",
  recipe: "Preheat the oven and bake seasoned salmon fillets until cooked through.
  Steam broccoli and cook quinoa according to package instructions.",
  day: 3,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  {name: "Salmon"},
  {name: "Brocoli"}
])

meal = program.meals.build(
  name: "Protein Smoothie",
  recipe: "Blend almond milk, a banana, lactose-free protein powder, and a handful of berries until smooth.
  Add ice if desired.",
  day: 4,
  type_of_meal: "breakfast"
)

meal.save

meal.ingredients.build([
  {name: "almond milk"},
  {name: "lactose-free protein powder"}
])

meal = program.meals.build(
  name: "Turkey Wrap",
  recipe: "Lay out a whole wheat tortilla.
  Add slices of turkey, avocado, lettuce, and tomato.
  Roll it up and enjoy with raw carrots on the side.",
  day: 5,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  {name: "Tortilla"},
  {name: "Turkey"}
])

meal = program.meals.build(
  name: "Stir-Fried Beef with Vegetables",
  recipe: "Stir-fry beef strips with bell peppers, broccoli, and mushrooms.
  Add a light soy sauce for flavor.
  Serve over brown rice.",
  day: 6,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  {name: "Broccoli"},
  {name: "Beef"}
])

meal = program.meals.build(
  name: "Lactose-Free Yogurt with Fruits and Nuts",
  recipe: "Mix lactose-free yogurt with fresh strawberries and a handful of almonds.",
  day: 7,
  type_of_meal: "breakfast"
)

meal.save

meal.ingredients.build([
  {name: "Lactose-Free yogurt"},
  {name: "Almond"}
])

program =  Program.create!(
  user_id: existing_user_ids.sample,
  goal: "weight maintenance",
  diet: "Omnivorous",
  allergies: "Shellfish",
  nb_of_meals_by_day: 2,
   nb_of_days: 6,
  nb_of_snacks: 0,
  height: 176,
  weight: 70
)

meal = program.meals.build(
  name: " Mushroom and Spinach Omelette",
  recipe: "Whisk 2 eggs and pour into a heated, non-stick skillet.
  Add chopped mushrooms, spinach, and grated cheese.
  Cook until the eggs are set, then fold in half.
  Serve with a slice of whole wheat toasted bread.",
  day: 1,
  type_of_meal: "breakfast"
)

meal.save

meal.ingredients.build([
  {name: "Egg"},
  {name: "Mushroom"}
])


meal = program.meals.build(
  name: "Roasted Chicken with Quinoa and Vegetables",
  recipe: "Roast chicken seasoned with herbs.
  Cook quinoa according to package instructions.
  Roast vegetables (carrots, zucchini, bell peppers) with olive oil.",
  day: 2,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  {name: "Rosted Chiken"},
  {name: "carrots"}
])

meal = program.meals.build(
  name: " Greek Yogurt with Almonds and Berries",
  recipe: "Mix natural Greek yogurt with almonds and fresh berries.",
  day: 3,
  type_of_meal: "breakfast"
)

meal.save

meal.ingredients.build([
  {name: "Greek yogurt"},
  {name: "Berries"}
])


meal = program.meals.build(
  name: "Beef Stir-Fry with Vegetables",
  recipe: "Stir-fry beef strips with broccoli, bell peppers, and mushrooms.
  Add soy sauce for flavor.
  Serve over brown rice.",
  day: 4,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  {name: "Beef"},
  {name: "Broccoli"}
])


meal = program.meals.build(
  name: "Spinach Banana Smoothies",
  recipe: "Blend spinach, banana, and almond milk until smooth.
  Toast a slice of whole wheat bread and spread almond butter.",
  day: 5,
  type_of_meal: "breakfast"
)

meal.save

meal.ingredients.build([
  {name: "Spinach"},
  {name: "Banana"}
])


program =  Program.create!(
  user_id: existing_user_ids.sample,
  goal: "weight maintenance",
  diet: "Keto",
  allergies: "Shellfish",
  nb_of_meals_by_day: 2,
   nb_of_days: 6,
  nb_of_snacks: 0,
  height: 176,
  weight: 70
)

meal = program.meals.build(
  name: "Scrambled Eggs with Cheese and Avocado",
  recipe: "Whisk 2-3 eggs, add salt, pepper, and a pinch of herbs.
  Cook in a pan over medium heat until scrambled.
  Sprinkle with shredded cheese and serve with sliced avocado.",
  day: 1,
  type_of_meal: "breakfast"
)

meal.save

meal.ingredients.build([
  {name: "Egg"},
  {name: "Avocado"}
])

meal = program.meals.build(
  name: "Grilled Salmon with Keto Vegetables",
  recipe: "Season salmon with salt, pepper, and lemon juice.
  Grill until cooked through.
  Roast broccoli and cauliflower with olive oil.",
  day: 1,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  {name: "Salmon"},
  {name: "Pepper"}
])

meal = program.meals.build(
  name: "Keto Chicken Caesar Salad",
  recipe: "Grill chicken breast with your preferred keto-friendly seasonings.
  Toss with romaine lettuce and keto Caesar dressing.
  Garnish with parmesan shavings.",
  day: 2,
  type_of_meal: "breakfast"
)

meal.save

meal.ingredients.build([
  {name: "Chicken"},
  {name: "Lettuce "}
])

meal = program.meals.build(
  name: "Pulled Pork with Sautéed Kale",
  recipe: "Pulled Pork with Sautéed Kale",
  day: 3,
  type_of_meal: "lunch/dinner"
)

meal.save

meal.ingredients.build([
  {name: "Pork"},
  {name: "Sautéed Kale"}
])

meal = program.meals.build(
  name: "Turkey Lettuce Wrap",
  recipe: "Wrap slices of turkey, cheese, mayo, and lettuce in large lettuce leaves.",
  day: 1,
  type_of_meal: "breakfast"
)

meal.save

meal.ingredients.build([
  {name: "Turkey"},
  {name: "cheese"}
])
