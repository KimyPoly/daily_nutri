class Meal < ApplicationRecord
  has_many :programs, through: :meal_assignments
end
