class MealAssignement < ApplicationRecord
  belongs_to :meal
  belongs_to :program
end
