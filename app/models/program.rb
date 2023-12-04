class Program < ApplicationRecord
  GOAL = ["Lose weight", "Weight maintenance", "Gain weight"]
  DIET = ["Vegan", "Vegetarian", "Omnivorous", "Pescatarian", "Keto"]
  ALLERGIES = ["None", "Nuts", "Crusta", "Milk", "Eggs", "Fish", "Crustacean",
               "Shellfish", "Peanuts", "Wheat", "Soybeans", "Sesame"]

  belongs_to :user
  has_many :meal_assignements, dependent: :destroy
  has_many :meals, through: :meal_assignements
  validates :goal, presence: true, inclusion: { in: GOAL }
  validates :diet, presence: true, inclusion: { in: DIET }

  validates :allergies, presence: true
  validates :nb_of_meals_by_day, presence: true, inclusion: { in: [2, 3, 4] }
  validates :nb_of_days, presence: true, inclusion: { in: 2..7 }
  validates :nb_of_snacks, presence: true, inclusion: { in: 0..3 }
  validates :height, presence: true
  validates :weight, presence: true
  validates :sexe, presence: true, inclusion: { in: ["Male", "Female"] }

  def total_calories
    meals.pluck(:calories).sum
  end

  def calories_goal
    @genre = sexe
    @asked_goal = goal
    @calories_goal = case
    when @genre == "Male" && @asked_goal == "Weight maintenance"
      @calories_goal = 2600
    when @genre == "Male" && @asked_goal == "Lose weight"
      @calories_goal = 2300
    when @genre == "Male" && @asked_goal == "Take weight"
      @calories_goal = 3100
    when @genre == "Female" && @asked_goal == "Weight maintenance"
      @calories_goal = 2000
    when @genre == "Female" && @asked_goal == "Lose weight"
      @calories_goal = 1800
    when @genre == "Female" && @asked_goal == "Take weight"
      @calories_goal = 2500
    else
      0
    end
    return @calories_goal * nb_of_days
  end
end
