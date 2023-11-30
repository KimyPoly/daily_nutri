class Meal < ApplicationRecord
  has_many :meal_assignements, dependent: :destroy
  has_many :programs, through: :meal_assignements

end
