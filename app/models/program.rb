class Program < ApplicationRecord
  attr_accessor :objectif

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

  # def fix_cal
  #   weight = 65
  #   height = 1.80
  #   age = 18
  #   activite = 1.2
  #   if sexe == "Female"
  #     @mb = (655 + (9.6 * weight) + (500 * height) - (4.7 * age)) * activite
  #   else
  #     @mb = (66 + (13.7 * weight) + (185 * height) - (6.5 * age)) * activite
  #   end
  # end

  # def calories_goal
  #   fix_cal
  #   case goal
  #   when "Lose weight"
  #     @calories_goal = @mb - 500
  #   when "Weight maintenance"
  #     @calories_goal = @mb
  #   when "Gain weight"
  #     @calories_goal = @mb + 500
  #   end
  #   return (@calories_goal * nb_of_days).to_i
  # end
end
