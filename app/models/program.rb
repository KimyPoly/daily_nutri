class Program < ApplicationRecord
  GOAL = ["Lose weight", "Weight maintenance", "Gain weight"]
  DIET = ["Vegan", "Vegetarian", "Omnivorous", "Pescatarian", "Keto"]
  ALLERGIES = ["None", "Nuts", "Crusta", "Milk", "Eggs", "Fish", "Crustacean",
               "Shellfish", "Peanuts", "Wheat", "Soybeans", "Sesame"]

  belongs_to :user
  has_many :meal_assignements
  has_many :meals, through: :meal_assignements
  validates :goal, presence: true, inclusion: { in: GOAL }
  validates :diet, presence: true, inclusion: { in: DIET }
  validates :allergies, presence: true, inclusion: { in: ALLERGIES }
  validates :nb_of_meals_by_day, presence: true, inclusion: { in: [2, 3, 4] }
  validates :nb_of_days, presence: true, inclusion: { in: 2..7 }
  validates :nb_of_snacks, presence: true, inclusion: { in: 0..3 }
  validates :height, presence: true
  validates :weight, presence: true
end
