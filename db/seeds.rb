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

Program.create!(
  user_id: existing_user_ids.sample,
  goal: "lose weight",
  diet: "Omnivorous",
  allergies: "Nuts",
  nb_of_meals_by_day: 3,
  nb_of_days: 6,
  nb_of_snacks: 1,
  height: 180,
  weight: 90
)

Program.create(
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

Program.create(
  user_id: existing_user_ids.sample,
  goal: "lose weight",
  diet: "Omnivorous",
  allergies: "Milk",
  nb_of_meals_by_day: 3,
  nb_of_days: 7,
  nb_of_snacks: 3,
  height: 178,
  weight: 100
)
Program.create(
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

Program.create(
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

# Program.create(
#    user_id: existing_user_ids.sample,
#   goal: ["lose weight", "weight maintenance", "gain weight"].sample,
#   diet: ["Vegan", "Vegetarian", "Omnivorous", "Pescatarian", "Keto"].sample,
#   allergies: ["Nuts", "Crusta", "Milk", "Eggs", "Fish", "Crustacean", "Shellfish", "Peanuts", "Wheat", "Soybeans", "Sesame"].sample,
#   nb_of_meals_by_day: [2, 3, 4].sample,
#   nb_of_days: rand(2..7),
#   nb_of_snacks: rand(0..3),
#   height: rand(150..190),
#   weight: rand(50..100)
# )


# Meal.create!(
#   name: "Spaghetti Bolognese",
#   recipe: "Cook chopped onions and garlic in olive oil until soft.
#   Add ground beef and cook until browned.
#   Pour in tomato sauce, simmer, and season with salt and pepper.
#   Cook spaghetti separately, then combine with the Bolognese sauce.",
#   day: 1,
#   type_of_meal: "lunch"
# )

# Meal.create!(
#   name: "Chicken Caesar Salad",
#   recipe: "Grill chicken breast until fully cooked.
#   Chop Romaine lettuce and place it in a bowl.
#   Add croutons, grated Parmesan cheese, and sliced grilled chicken.
#   Drizzle Caesar dressing over the salad and toss before serving.",
#   day: 2,
#   type_of_meal: "lunch"
# )

# Meal.create!(
#   name: "Vegetarian Stir-Fry",
#   recipe: "Press and cube tofu, stir-fry until golden.
#   Add chopped broccoli, bell peppers, and carrots to the pan.
#   Mix in minced ginger and garlic, stir-fry until vegetables are tender.
#   Season with soy sauce and serve over rice or noodles.",
#   day: 3,
#   type_of_meal: "lunch"
# )

# Meal.create!(
#   name: "Salmon with Lemon Dill Sauce",
#   recipe: "Preheat oven and place salmon fillets on a baking sheet.
#   Drizzle with olive oil, squeeze lemon juice, and sprinkle with chopped dill.
#   Season with salt and pepper, then bake until salmon is cooked through.",
#   day: 4,
#   type_of_meal: "lunch"
# )

# Meal.create!(
#   name: "Mushroom Risotto",
#   recipe: "Sauté chopped onions and mushrooms in olive oil until softened.
#   Add Arborio rice and stir until lightly toasted.
#   Pour in white wine and let it evaporate, then add broth gradually while stirring.
#   Once the rice is creamy and cooked, stir in grated Parmesan cheese before serving.",
#   day: 5,
#   type_of_meal: "lunch"
# )

# Meal.create!(
#   name: "Quinoa and Vegetable Stuffed Peppers",
#   recipe: "Cook quinoa according to package instructions.
#   Mix cooked quinoa with black beans, corn, diced tomatoes, and seasoning.
#   Cut bell peppers in half and stuff them with the quinoa and vegetable mixture.
#   Bake in the oven until peppers are tender.",
#   day: 6,
#   type_of_meal: "lunch"
# )

# Meal.create!(
#   name: "Grilled Chicken Salad",
#   recipe: "Grill the chicken breast until fully cooked.
#   Slice the grilled chicken into strips.
#   Toss mixed salad greens, cherry tomatoes, and sliced cucumber in a bowl.
#   Top the salad with grilled chicken strips.
#   Drizzle with a dressing made of olive oil, balsamic vinegar, salt, and pepper.",
#   day: 7,
#   type_of_meal: "lunch"
# )

program = Program.create(
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
program.meals.build(
  name: "Quinoa Salad",
  recipe: "Cook quinoa and let it cool.
  Mix quinoa with chopped vegetables like cucumbers, tomatoes, and bell peppers.
  Drizzle with olive oil and lemon juice, and season with salt and pepper.",
  day: 2,
  type_of_meal: "dinner"
).save

program.meals.build(
  name: "Stuffed Bell Peppers",
  recipe: "Cut bell peppers in half and remove seeds.
  Fill each half with a mixture of cooked quinoa, black beans, corn, and diced tomatoes.
  Bake in the oven until peppers are tender.",
  day: 3,
  type_of_meal: "dinner"
).save

program.meals.build(
  name: "Tofu Stir-Fry",
  recipe: "Press and cube tofu, stir-fry until golden.
  Add broccoli, bell peppers, and carrots to the pan.
  Mix in minced ginger and garlic, stir-fry until vegetables are tender.
  Season with soy sauce and serve over rice.",
  day: 4,
  type_of_meal: "lunch"
).save

program.meals.build(
  name: "Chickpea Salad",
  recipe: "Combine chickpeas with chopped cucumber, cherry tomatoes, and red onion.
  Dress with olive oil, lemon juice, and your favorite herbs.",
  day: 5,
  type_of_meal: "dinner"
).save
